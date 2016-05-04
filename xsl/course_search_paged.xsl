<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:import href="common.xsl"/>
    <xsl:param name="qString"/>
    <xsl:param name="page_name"/>
    
    <xsl:template match="courses">
        <h2>Selected Courses</h2>
            <table class="table table-bordered table-striped table-condensed">
                
                    <tr>    
                        <td class="width25">Number</td>
                        <td class="hidden-xs width20">Term</td>
                        <td class="width35">Title</td>
                        <td class="width10">View</td>
                        <td >PDF</td>
                    </tr>
                
                
                    <xsl:for-each select="./block/course" >
                        <tr>
                            <td>
                                <xsl:value-of select="course_group"/><xsl:text> </xsl:text>
                                <xsl:value-of select="course_number/num_int"/>
                                <xsl:value-of select="course_number/num_char"/>
                            </td>
                            <td class="hidden-xs"><xsl:value-of select="term"/></td>
                            <td>
                                <xsl:if test="./@offered = 'N'">[</xsl:if>
                                <xsl:if test="instructor_approval_required = 'Y'">*</xsl:if>
                                <xsl:value-of select="title"/>
                                <xsl:if test="./@offered = 'N'">]</xsl:if>
                            </td>
                            <td>
                                <a href="{$baselink}search_courses/{./@cat_num}.html?cat_num={./@cat_num}">
                                    View Details
                                </a>
                            </td>
                            <td>
                                <a href="{$baselink}course.pdf?cat_num={./@cat_num}">
                                    Make PDF
                                </a>
                            </td>
                        </tr>
                    </xsl:for-each>
                
            </table>
        
        <xsl:apply-templates select="//courses/block"/>
        
    </xsl:template>    
    
    <!-- Breadcrumbs gets called from Common -->
    <xsl:template name="breadcrumbs">
        <li>
            <a href="{$baselink}search.html" class="show-pointer" title="Search">
                <xsl:call-template name="arrow"/>
                Search
            </a>
        </li>
        <li>
            <a href="#" title="Selected Courses">
                <xsl:call-template name="arrow"/>
                Selected Courses
            </a>
        </li>
    </xsl:template> 
    
</xsl:stylesheet>