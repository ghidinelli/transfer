����  - q 
SourceFile ?D:\wwwroot\cfunit\src\net\sourceforge\cfunit\core\TestMyCFC.cfc )cfTestMyCFC2ecfc262330807$funcTESTEXAMPLE  coldfusion/runtime/UDFMethod  <init> ()V  
  	 this +LcfTestMyCFC2ecfc262330807$funcTESTEXAMPLE; LocalVariableTable Code 	ARGUMENTS  bindInternal C(Ljava/lang/String;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext;  	   getOut ()Ljavax/servlet/jsp/JspWriter;    javax/servlet/jsp/PageContext "
 # ! parent Ljavax/servlet/jsp/tagext/Tag; % &	  ' 
		 ) _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V + ,
  - fail / _get &(Ljava/lang/String;)Ljava/lang/Object; 1 2
  3 java/lang/Object 5 No Tests Implemented! 7 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; 9 :
  ; 
	 = java/lang/String ? testExample A metaData Ljava/lang/Object; C D	  E void G public I &coldfusion/runtime/AttributeCollection K name M 
returntype O access Q 
Parameters S ([Ljava/lang/Object;)V  U
 L V getReturnType ()Ljava/lang/String; getName runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value 	ARGUMENTS Lcoldfusion/runtime/Variable; THIS LineNumberTable <clinit> 	getAccess getParamList ()[Ljava/lang/String; getMetadata ()Ljava/lang/Object; 1       C D           #     *� 
�                 X Y     !     H�                 Z Y     !     B�                 [ \     �  
   J+� :+,� :	-� � $:-� (:-*� .-0� 40-� 6Y8S� <W->� .�       f 
   J       J ] ^    J _ D    J ` a    J b c    J d e    J f D    J % &    J g h    J i h 	 j   & 	   	 " 
 " 
 *  9  *  *  *  @   k      Z     <� LY� 6YNSYBSYPSYHSYRSYJSYTSY� 6S� W� F�           <      l Y     !     J�                 m n     #     � @�                 o p     "     � F�                     ����  - X 
SourceFile ?D:\wwwroot\cfunit\src\net\sourceforge\cfunit\core\TestMyCFC.cfc cfTestMyCFC2ecfc262330807  coldfusion/runtime/CFComponent  <init> ()V  
  	 this LcfTestMyCFC2ecfc262330807; LocalVariableTable Code com.macromedia.SourceModTime  ���� coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext;  	   getOut ()Ljavax/servlet/jsp/JspWriter;   javax/servlet/jsp/PageContext 
   parent Ljavax/servlet/jsp/tagext/Tag;  	    
	 " _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V $ %
  & 
 ( testExample Lcoldfusion/runtime/UDFMethod; )cfTestMyCFC2ecfc262330807$funcTESTEXAMPLE ,
 - 	 * +	  / testExample 1 registerUDF 3(Ljava/lang/String;Lcoldfusion/runtime/UDFMethod;)V 3 4
  5 metaData Ljava/lang/Object; 7 8	  9 &coldfusion/runtime/AttributeCollection ; java/lang/Object = extends ? )net.sourceforge.cfunit.framework.TestCase A Name C 	TestMyCFC E 	Functions G	 - 9 ([Ljava/lang/Object;)V  J
 < K runPage ()Ljava/lang/Object; out Ljavax/servlet/jsp/JspWriter; value LineNumberTable <clinit> 
getExtends ()Ljava/lang/String; getMetadata registerUDFs 1       * +    7 8           #     *� 
�                 M N     m     *� � L*� !N*+#� '*+)� '�       *            O P     Q 8        R      	       S      j 	    @� -Y� .� 0� <Y� >Y@SYBSYDSYFSYHSY� >Y� ISS� L� :�           @     R     4 	  T U     !     B�                 V N     "     � :�                 W      (     
*2� 0� 6�           
               