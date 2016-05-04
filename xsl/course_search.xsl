<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:import href="common.xsl"/>
    <xsl:param name="qString"/>
    
    <xsl:template match="courses">
        <h2>Selected Courses</h2>
            <table class="table table-bordered table-striped table-condensed"  style="width: 100%;">
                <thead>
                    <tr>    
                        <td style="width: 25%;">Number</td>
                        <td style="width: 20%;" class="hidden-xs">Term</td>
                        <td style="width: 35%;">Title</td>
                        <td style="width: 10%;">View</td>
                        <td style="width: *;">PDF</td>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="./course" >
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
                </tbody>
            </table>
    </xsl:template>    
    
    <!-- Breadcrumbs gets called from Common -->
    <xsl:template name="breadcrumbs">
        <li>
            <a onclick="window.history.back();" style="cursor:pointer;" title="Search">
                <xsl:call-template name="arrow"/>
                Search
            </a>
        </li>
        <li>
            <a href="{$baselink}searchedcourses.html?{$qString}" title="Selected Courses">
                <xsl:call-template name="arrow"/>
                Selected Courses
            </a>
        </li>
    </xsl:template> 
    
</xsl:stylesheet>