<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  
  xmlns="http://www.w3.org/1999/xhtml"
  version="2.0">
  
  <xsl:import href="common.xsl"/>
  <xsl:import href="detail_body.xsl"/>
  <xsl:param name="cat_num" />
  <xsl:variable name="dept_num" select="/courses/course[@cat_num eq $cat_num]/department/@code" />
  
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
    <li>
      <a href="">
        <xsl:call-template name="arrow"/>
        <xsl:call-template name="course_title"/>
      </a>
    </li>
  </xsl:template> 

</xsl:stylesheet>

