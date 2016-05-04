<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml"
  version="2.0">
  <!-- Attribute sets for formatting  -->
  <xsl:attribute-set name="gray-border">
    <xsl:attribute name="border-color">lightgray</xsl:attribute>
    <xsl:attribute name="border-style">solid</xsl:attribute>
    <xsl:attribute name="border-width">thin</xsl:attribute>
    <xsl:attribute name="padding-left">2mm</xsl:attribute>
    <xsl:attribute name="padding-top">1mm</xsl:attribute>
    <xsl:attribute name="padding-bottom">1mm</xsl:attribute>
  </xsl:attribute-set> 
  
  <xsl:attribute-set name="myfont">
    <xsl:attribute name="font-size">12pt</xsl:attribute>
    <xsl:attribute name="color">black</xsl:attribute>
  </xsl:attribute-set> 
  
  <xsl:attribute-set name="title-style">
    <xsl:attribute name="font-size">16pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="block-spacing">
    <xsl:attribute name="space-before">1mm</xsl:attribute>
    <xsl:attribute name="space-after">1mm</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:param name="url"/>
  <xsl:param name="baselink"/>
  <xsl:variable name="title" select="'Departments'"/>
  
  <!-- Main template for the PDF page -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Harvard University, Faculty of Arts &amp; Sciences, Course Catalog</title>
        <link rel="stylesheet" type="text/css" href="{$baselink}css/site.css" />
        <link href="{$baselink}css/bootstrap.min.css" rel="stylesheet"/>
      </head>
      <body>
      	<div class="container">
      	  <div class="navbar navbar-default">
      		<!-- header -->
      		<xsl:call-template name="header"/>
      	  </div>
      		<!-- main -->
      	  <div class="container">
      	    <xsl:apply-templates select="courses"/>
      		</div>
      		<!-- footer -->
      	  <div class="container">
      		  <xsl:call-template name="footer"/>
      		</div>
      	</div>
      </body>
    </html>
  </xsl:template>

  <!-- Creates the header Div for the first PDF page -->
  <xsl:template name="header">
    <div id="header">
      <img src="{$baselink}images/harvard_shield.png" alt="Shield" style="float:left;"/>
    	<h1>Harvard University, Faculty of Arts &amp; Sciences
    	<br/>Course Catalog</h1>
    </div>
  </xsl:template>  
	
  <!-- Creates the footer Div for the first PDF page -->
	<xsl:template name="footer">
	  <div id="footer" class="text-center">
      <hr/>
	      <p class="text-muted">
          <a href="http://www.harvard.edu/" class="text-muted">Harvard University</a><xsl:text> | </xsl:text>
          <a href="http://www.fas.harvard.edu/home/" class="text-muted">Faculty of Arts &amp; Sciences</a><xsl:text> | </xsl:text>
          <a href="http://college.harvard.edu/" class="text-muted">Harvard College</a><xsl:text> | </xsl:text>
          <a href="http://www.gsas.harvard.edu/" class="text-muted">Graduate School of Arts &amp; Sciences</a>
      	</p>
     </div>
   </xsl:template>
  
  
  
  <!-- Builds the Course Title String -->
  <xsl:template name="course_title">
    <xsl:param name="cat_num" />
    <xsl:variable name="current_course" select="/courses/course[@cat_num eq $cat_num]" />
    <xsl:variable name="not_offered"  select="$current_course/@offered = 'N'"/>
    <xsl:if test="$not_offered">[</xsl:if>
    <xsl:if test="$current_course/instructor_approval_required = 'Y'">*</xsl:if>
    <xsl:value-of select="$current_course/course_group"/><xsl:text> </xsl:text>
    <xsl:value-of select="$current_course/course_number/num_int"/>
    <xsl:value-of select="$current_course/course_number/num_char"/>
    <xsl:text>. </xsl:text>
    <xsl:value-of select="$current_course/title"/>
    <xsl:if test="$not_offered">]</xsl:if>
  </xsl:template>
  
  <xsl:template match="text()" />

</xsl:stylesheet>
