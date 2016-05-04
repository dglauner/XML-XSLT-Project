<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:h="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.w3.org/1999/xhtml"
    version="2.0">
    <xsl:import href="common.xsl"/>
    <xsl:param name="dept_num"/> 
    <xsl:param name="qString"/>
    <xsl:param name="page_name"/>
    
    <xsl:template match="courses">
        <xsl:variable name="add_menu" select="count(distinct-values(course[department[@code = $dept_num]]//following-sibling::course_group[1])) > 1" /> 
        <h2><xsl:call-template name="department_name"/></h2>
        
        
       <xsl:for-each-group select="course[department[@code = $dept_num]]" group-by="course_group">
           <xsl:sort select="current-grouping-key()" />
           <xsl:if test="$add_menu">
               <!-- Add a shortcut menu and subheadings only if there is more then 1 sub-group -->
               <xsl:call-template name="Shortcut_menu"/><br/>
               <h3>
                   <a name="{replace(current-grouping-key(),' ','_')}">
                       <xsl:value-of select="current-grouping-key()"/>
                   </a>
               </h3>
           </xsl:if>
           <br/>
           <table class="table table-bordered table-striped table-condensed full-width">
                
                    <tr>    
                        <td class="width25">Number</td>
                        <td class="hidden-xs width20">Term</td>
                        <td class="width35">Title</td>
                        <td class="width10">View</td>
                        <td>PDF</td>
                    </tr>
                
                
                    <xsl:for-each select="current-group()">
                        <xsl:sort select="course_number/num_int" data-type="number" />
                        <xsl:sort select="course_number/num_char"/>
                        <xsl:sort select="title"/>
                        <tr>
                            <td>
                                <xsl:value-of select="course_group"/><xsl:text> </xsl:text>
                                <xsl:value-of select="course_number/num_int"/>
                                <xsl:value-of select="course_number/num_char"/>
                            </td>
                            <td class="hidden-xs"><xsl:value-of select="term"/></td>
                            <td>
                                <xsl:variable name="not_offered"  select="./@offered = 'N'"/>
                                <xsl:if test="$not_offered">[</xsl:if>
                                <xsl:if test="instructor_approval_required = 'Y'">*</xsl:if>
                                <xsl:value-of select="title"/>
                                <xsl:if test="$not_offered">]</xsl:if>
                            </td>
                            <td>
                                <a href="{$baselink}courses/{./@cat_num}.html?cat_num={./@cat_num}">
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
        </xsl:for-each-group>
    </xsl:template>
    
    <!-- Create the shortcut menu -->
    <xsl:template name="Shortcut_menu">
        <div class="text-center">
            <xsl:for-each select="distinct-values(/courses/course[department[@code = $dept_num]]//following-sibling::course_group[1])">
                <xsl:sort/>
                <a href="#{replace(.,' ','_')}"><xsl:value-of select="."/></a>
                <xsl:if test="position() &lt; last()">
                    <xsl:text> | </xsl:text>
                </xsl:if>
            </xsl:for-each>
        </div>
    </xsl:template>
    
    <!-- Breadcrumbs gets called from Common -->
    <xsl:template name="breadcrumbs">
        <li>
            <a href="{$baselink}browse.html">
                <xsl:call-template name="arrow"/>
                <xsl:value-of select="$title"/>
            </a>
        </li>
        <li>
            <a href="{$baselink}departments/{$dept_num}.html">
                <xsl:call-template name="arrow"/>
                <xsl:call-template name="department_name"/>
            </a>
        </li>
    </xsl:template> 
    
</xsl:stylesheet>