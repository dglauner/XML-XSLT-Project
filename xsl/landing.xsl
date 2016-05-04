<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:import href="common.xsl"/>
    
    <xsl:template match="courses">
        <h2>Welcome To The Course Catalog</h2>
        
        <div class="panel panel-default">
            <div class="panel-heading"><h3>To continue please select an option below</h3></div>
            <div class="panel-body">
                <ul class="nav nav-pills nav-stacked">
                    <li class="active"><a href="{$baselink}browse.html">Browse By Department For Classes</a></li>
                    <li class="active"><a href="{$baselink}search.html">Search For Classes</a></li>
                </ul>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>