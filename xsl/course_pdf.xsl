<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:import href="common_pdf.xsl"/>
    <xsl:param name="baselink"/>
    <xsl:param name="qString"/>
    
    <xsl:variable name="cat_num" select="substring-after($qString, '=')" />
    
    <xsl:template match="/">
        <fo:root >
            <fo:layout-master-set>
                <fo:simple-page-master 
                    master-name="simple"
                    page-height="11in"
                    page-width="8.5in"
                    margin-top="0.5in"
                    margin-botom="0.5in"
                    margin-left="1.0in"
                    margin-right="1.0in"
                    >
                    <fo:region-body margin-top="1.3in" margin-bottom="1in"/>
                    <fo:region-before extent="2in"/>
                    <fo:region-after extent="0.75in"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            
            <fo:page-sequence master-reference="simple" xsl:use-attribute-sets="myfont">
                <!-- Header -->
                <fo:static-content flow-name="xsl-region-before" >
                    <fo:block background-color="aliceblue" xsl:use-attribute-sets="gray-border">
                        <fo:block float="left">
                            <fo:external-graphic src="url(http://localhost:8080/cocoon/finalproject-dglauner/images/harvard_shield.gif)" height="20px" width="20px"/>
                        </fo:block>
                        <fo:block  xsl:use-attribute-sets="title-style" text-align="center">
                            Harvard University, Faculty of Arts &amp; Sciences
                        </fo:block>
<!--                        <fo:block text-align="center">
                            <xsl:value-of select="distinct-values(/courses/course/department/dept_long_name)" />
                            , Page <fo:page-number /> of <fo:page-number-citation ref-id="theEnd"/>
                        </fo:block>-->
                        <fo:block>
                            <xsl:text>&#x00A0;</xsl:text>
                        </fo:block>
                        <fo:block>
                            <xsl:text>&#x00A0;</xsl:text>
                        </fo:block>
                    </fo:block>
                </fo:static-content>     
                
                <!-- Footer -->
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block text-align="center" background-color="aliceblue" xsl:use-attribute-sets="gray-border">
                        <fo:basic-link internal-destination="theStart">
                            Return To The Top of the Page
                        </fo:basic-link>
                    </fo:block>
                </fo:static-content>
                
                <!-- main Content -->
                <fo:flow flow-name="xsl-region-body">
                    <fo:block>
                        <xsl:apply-templates select="courses" mode="main"/>
                    </fo:block>
                    <fo:block id="theEnd"></fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
    
    <!--  Builds Course Details Page  -->
    <xsl:template match="courses" mode="main">
        <xsl:for-each select="course">
            <fo:block id="{./@cat_num}">
                <fo:block xsl:use-attribute-sets="block-spacing title-style">
                    <xsl:call-template name="course_title">
                        <xsl:with-param name="cat_num" select="./@cat_num" />
                    </xsl:call-template>
                </fo:block>
                <fo:block  xsl:use-attribute-sets="block-spacing">
                    Catalog Number: <xsl:value-of select="./@cat_num"/>
                </fo:block>
                <fo:block font-style="italic"  xsl:use-attribute-sets="block-spacing">
                    <xsl:value-of select="./faculty_text"/>
                </fo:block>
                <fo:block font-style="italic"  xsl:use-attribute-sets="block-spacing">
                    <xsl:value-of select="./credit"/>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="./term"/>
                    <xsl:text>) </xsl:text>
                    <xsl:value-of select="./meeting_text"/>
                </fo:block>
                <fo:block  xsl:use-attribute-sets="block-spacing">
                    <xsl:value-of select="./course_level"/>
                    <xsl:text> / </xsl:text>
                    <xsl:value-of select="./course_type"/>
                </fo:block>
                <fo:block xsl:use-attribute-sets="block-spacing" margin-left="5mm">
                    <xsl:value-of select="./description"/>
                </fo:block>
                <fo:block xsl:use-attribute-sets="block-spacing" margin-left="5mm">
                    Notes:<xsl:text> </xsl:text><xsl:value-of select="./notes"/>
                </fo:block>
            </fo:block>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>