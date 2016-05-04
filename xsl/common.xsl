<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml"
  version="2.0">
  <xsl:param name="url"/>
  <xsl:param name="baselink"/>
  
  
  
  <xsl:variable name="title" select="'Departments'"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>Harvard University, Faculty of Arts &amp; Sciences, Course Catalog</title>
        <link rel="stylesheet" type="text/css" href="{$baselink}css/site.css" />
        <link rel="stylesheet" type="text/css" href="{$baselink}css/bootstrap.min.css" />
      </head>
      <body>
      	<div>
      	  <div class="navbar navbar-default container">
      		<!-- header -->
      	  	<table class="full-width">
      	      <tr>
      	        <td>
      	          <xsl:call-template name="header"/>
      	        </td>
      	      </tr>
      	      <tr>
      	        <td>
      	          <div id="breadcrumbs">
      	            <ul class="nav navbar-nav breadcrumbs">
      	              <li class="nopadding" >
      	                <a href="{$baselink}index.html">Home</a>
      	              </li>
      	              <!-- Page specific breadcrumb menu routines gets called from Common, 
      	             but are specific to each page that common is imported on-->
      	              <xsl:call-template name="breadcrumbs"/>
      	            </ul>
      	          </div>
      	        </td>
      	      </tr>
      	    </table>
      			

      	  </div>
      		<!-- main -->
      	  <div class="container">
      			  <xsl:apply-templates />
      		</div>
      		<!-- footer -->
      	  <div class="container">
      		  <xsl:call-template name="footer"/>
      		</div>
      	</div>
      </body>
    </html>
  </xsl:template>

  <!-- Creates the header Div -->
  <xsl:template name="header">
    <div id="header">
    	<img src="{$baselink}images/harvard_shield.png" alt="Shield" width="72" height="85" class="hidden-xs float-left"/>
    	<h2>Harvard University, Faculty of Arts &amp; Sciences
    	<br/>Course Catalog</h2>
    </div>
  </xsl:template>  
	
  <!-- Creates the footer Div -->
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
    
    <!-- department_name gets called from here as well as other pages where Common is imported -->
    <xsl:template name="department_name">
      <!-- dept_num is declared on the pages that import common -->
      <xsl:value-of select="distinct-values(/courses/course/department[@code eq $dept_num]/dept_short_name)" />
    </xsl:template>
	
	<xsl:template name="arrow">
		<img src="{$baselink}images/arrow.gif" alt="Arrow" width="20" height="5" />
	</xsl:template>
	
	<!--paging info-->
	<xsl:template match="block">
		<xsl:variable name="currentpage">
			<xsl:value-of select="//block[child::*]/@id"/>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="count(child::*) > 0">
				<xsl:value-of select="@id"/>
			</xsl:when>
			<xsl:otherwise>
				<a href="{concat($page_name,concat('page',@id))}.html?{$qString}">
					<xsl:value-of select="@id"/>
				</a>        
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="position() != last()">
			<xsl:text> | </xsl:text>
		</xsl:if>
	</xsl:template>    
  
    <xsl:template match="text()" />

</xsl:stylesheet>
