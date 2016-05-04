<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="courses">
        
        <xsl:apply-templates select="/courses/course[@cat_num eq $cat_num]" />
        
    </xsl:template>
    
    <xsl:template match="course">
        <h2><xsl:value-of select="./title"/></h2>
        <h3><xsl:call-template name="course_title"/></h3>
        <p>
            Catalog Number: <xsl:value-of select="$cat_num"/>
        </p>
        <p>
            <xsl:value-of select="./faculty_text"/>
        </p>
        <p>
            <xsl:value-of select="./credit"/>
            <xsl:text> (</xsl:text>
            <xsl:value-of select="./term"/>
            <xsl:text>) </xsl:text>
            <xsl:value-of select="./meeting_text" disable-output-escaping="yes"/>
        </p>
        <p>
            <xsl:value-of select="./course_level"/>
            <xsl:text> / </xsl:text>
            <xsl:value-of select="./course_type"/>
        </p>
        <div class="well well-small">
            <p>
                <xsl:value-of select="./description"/>
            </p>
            <p>
                Notes:<xsl:text> </xsl:text><xsl:value-of select="./notes"/>
            </p>
        </div>
    </xsl:template>
    
    <xsl:template name="course_title">
        <xsl:value-of select="/courses/course[@cat_num eq $cat_num]/course_group"/><xsl:text> </xsl:text>
        <xsl:value-of select="/courses/course[@cat_num eq $cat_num]/course_number/num_int"/>
        <xsl:value-of select="/courses/course[@cat_num eq $cat_num]/course_number/num_char"/>
    </xsl:template>
    
</xsl:stylesheet>