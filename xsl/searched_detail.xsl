<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:import href="common.xsl"/>
    <xsl:import href="detail_body.xsl"/>
    <xsl:param name="cat_num" />
    <xsl:variable name="dept_num" select="/courses/course[@cat_num eq $cat_num]/department/@code" />
    
    <!-- Breadcrumbs gets called from Common -->
    <xsl:template name="breadcrumbs">
        <li>
            <a href="{$baselink}search.html">
                <xsl:call-template name="arrow"/>
                <xsl:value-of select="'Search'"/>
            </a>
        </li>
        <li>
            <a onclick="window.history.back();" style="cursor:pointer;">
                <xsl:call-template name="arrow"/>
                <xsl:value-of select="'Selected Courses'"/>
            </a>
        </li>
        <li>
            <a href="">
                <xsl:call-template name="arrow"/>
                <xsl:call-template name="course_title"/>
            </a>
        </li>
    </xsl:template> 

</xsl:stylesheet>