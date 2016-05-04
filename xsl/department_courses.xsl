<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.w3.org/1999/xhtml"
    version="2.0">
    
    <xsl:import href="common.xsl"/>
    
    <xsl:key name="department" match="/courses/course/department/dept_short_name" use="." />
    
    <xsl:template match="courses">
        
        <h2><xsl:value-of select="$title"/></h2>
        <table class="table table-bordered table-striped table-condensed"  style="width: 100%;">
            <thead>
                <tr>
                    <td><xsl:value-of select="$title"/></td>
                    <td>Browse</td>
                    <td>PDF</td>
                </tr>
            </thead>
            <tbody>
            <xsl:for-each select="/courses/course/department/dept_short_name[generate-id() = generate-id(key('department',.)[1])]">
            <xsl:sort/>
            <tr>
                <td><xsl:value-of select="."/></td>
                <td>
                    <xsl:element name="a">
                        <xsl:attribute name="href">
                            departments/<xsl:value-of select="../@code"/>.html?department=<xsl:value-of select="../@code"/>
                        </xsl:attribute>
                        <xsl:text>Browse</xsl:text>
                    </xsl:element>
                    
                </td>
                <td>
                    <xsl:element name="a">
                        <xsl:attribute name="href">
                            department.pdf?department=<xsl:value-of select="../@code"/>
                        </xsl:attribute>
                        <xsl:text>PDF</xsl:text>
                    </xsl:element>
                </td>
            </tr>
            </xsl:for-each>
            </tbody>
        </table>
    </xsl:template>
    
    <!-- Breadcrumbs gets called from Common -->
    <xsl:template name="breadcrumbs">
        <li>
            <a href="{$baselink}browse.html">
                <xsl:call-template name="arrow"/>
                <xsl:value-of select="$title"/>
            </a>
        </li>
    </xsl:template> 
    
</xsl:stylesheet>