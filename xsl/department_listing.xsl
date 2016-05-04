<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns="http://www.w3.org/1999/xhtml" 
  version="2.0">
  <xsl:import href="common.xsl"/>
	
  <xsl:key name="department" match="/courses/course/department/dept_short_name" use="." />
	
  <xsl:template match="courses">
  	
  	<h2><xsl:value-of select="$title"/></h2>
	<ul>
		<xsl:for-each select="/courses/course/department/dept_short_name[generate-id() = generate-id(key('department',.)[1])]">
			<xsl:sort/>
			<li>
				<xsl:element name="a">
					<xsl:attribute name="href">
						departments/<xsl:value-of select="../@code"/>.html
					</xsl:attribute>
					<xsl:value-of select="."/>
				</xsl:element>
			</li>
		</xsl:for-each>
	</ul>
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