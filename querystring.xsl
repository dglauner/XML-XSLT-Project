<xsl:stylesheet version="2.0"   
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">
    
    <!--  
    **Sitemap passes querystring as a parameter**
    
    <map:transform src="xsl/search.xsl" type="xslt2">
        <map:parameter name="pQString" value="{request:queryString}"/>
    </map:transform>  -->
    
    <xsl:output indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:param name="pQString" as="xs:string" select=
        "'?login=userId&amp;tag=XSLT&amp;lang=eng&amp;level=expert'"
    />
    
    <xsl:template match="/">
        <xsl:variable name="vLang" as="xs:string" select=
            "substring-after(
            tokenize($pQString, '\?|&amp;')
            [starts-with(.,'lang=')]
            [last()],
            
            'lang='
            )
            "/>
        
        lang = <xsl:sequence select='$vLang'/>
    </xsl:template>
</xsl:stylesheet>