<!--- Document Information -----------------------------------------------------

Title:      ProviderManager.cfc

Author:     Mark Mandel
Email:      mark@compoundtheory.com

Website:    http://www.compoundtheory.com

Purpose:    Manges all the providers that are configured

Usage:

Modification Log:

Name			Date			Description
================================================================================
Mark Mandel		03/11/2009		Created

------------------------------------------------------------------------------->
<cfcomponent hint="Manges all the providers that are configured" output="false">

<!------------------------------------------- PUBLIC ------------------------------------------->

<cffunction name="init" hint="Constructor" access="public" returntype="ProviderManager" output="false">
	<cfargument name="configReader" hint="The XML Reader for the config file" type="transfer.com.io.XMLFileReader" required="Yes" _autocreate="false">
	<cfargument name="eventManager" hint="The event manager" type="transfer.com.events.EventManager" required="true" _autocreate="false">
	<cfscript>
		setProviders(StructNew());

		initProviders(arguments.configReader, arguments.eventManager);

		return this;
	</cfscript>
</cffunction>

<cffunction name="getProvider" hint="gets the cache provider for a given class" access="public" returntype="transfer.com.cache.provider.AbstractBaseProvider" output="false">
	<cfargument name="className" hint="the name of the class we are looking for a provider for" type="string" required="Yes">
	<cfscript>
		if(structKeyExists(getProviders(), arguments.className))
		{
			return structFind(getProviders(), arguments.className);
		}

		return getDefaultProvider();
    </cfscript>
</cffunction>

<!------------------------------------------- PACKAGE ------------------------------------------->

<!------------------------------------------- PRIVATE ------------------------------------------->

<cffunction name="initProviders" hint="initialises all the providers" access="private" returntype="void" output="false">
	<cfargument name="configReader" hint="The XML Reader for the config file" type="transfer.com.io.XMLFileReader" required="Yes">
	<cfargument name="eventManager" hint="The event manager" type="transfer.com.events.EventManager" required="true">
	<cfscript>
		var xObjectCache = arguments.configReader.search("/transfer/objectCache");
		var provider = 0;
		var counter = 1;
		var len = 0;
		var child = 0;

		/*
			If you can't find anything, ue ehCache
		*/
		if(arrayIsEmpty(xObjectCache))
		{
			provider = createObject("component", "transfer.com.cache.provider.EHCacheProvider").init("/transfer/com/cache/provider/ehcache-lib/ehcache.xml");
			provider.setEventManager(arguments.eventManager);

			setDefaultProvider(provider);
		}
		else
		{
			xObjectCache = xObjectCache[1]; // convenience

			if(NOT StructKeyExists(xObjectCache, "defaultCache"))
			{
				provider = createObject("component", "transfer.com.cache.provider.EHCacheProvider").init("/transfer/com/cache/provider/ehcache-lib/ehcache.xml");
				provider.setEventManager(arguments.eventManager);

				setDefaultProvider(provider);
			}
			else
			{
				provider = parseProvider(xObjectCache.defaultCache);
				provider.setEventManager(arguments.eventManager);
				setDefaultProvider(provider);

				len = arraylen(xObjectCache.xmlChildren);
				for(; counter lte len; counter++)
				{
					child = xObjectCache.xmlChildren[counter];

					if(child.xmlName eq "cache")
					{
						provider = parseProvider(child);

						provider.setEventManager(arguments.eventManager);

						structInsert(getProviders(), child.xmlAttributes.class, provider, true);
					}
				}
			}
		}
    </cfscript>
</cffunction>

<cffunction name="parseProvider" hint="parses a provider element" access="private" returntype="transfer.com.cache.provider.AbstractBaseProvider" output="false">
	<cfargument name="element" hint="the provider xml config" type="any" required="Yes">
	<cfscript>
		var class = arguments.element.xmlAttributes.provider;
		var args = {};
		var setting = 0;

		_trace(arguments.element);
    </cfscript>

	<cfloop array="#arguments.element.xmlChildren#" index="setting">
		<cfscript>
			args[setting.xmlAttributes.name] = setting.xmlAttributes.value;
        </cfscript>
	</cfloop>

	<cfreturn createObject("component", class).init(argumentCollection=args) />
</cffunction>

<cffunction name="getDefaultProvider" access="private" returntype="transfer.com.cache.provider.AbstractBaseProvider" output="false">
	<cfreturn instance.defaultProvider />
</cffunction>

<cffunction name="setDefaultProvider" access="private" returntype="void" output="false">
	<cfargument name="defaultProvider" type="transfer.com.cache.provider.AbstractBaseProvider" required="true">
	<cfset instance.defaultProvider = arguments.defaultProvider />
</cffunction>

<cffunction name="getProviders" access="private" returntype="struct" output="false">
	<cfreturn instance.providers />
</cffunction>

<cffunction name="setProviders" access="private" returntype="void" output="false">
	<cfargument name="providers" type="struct" required="true">
	<cfset instance.providers = arguments.providers />
</cffunction>

</cfcomponent>