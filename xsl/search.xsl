<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:import href="common.xsl"/>
    
    <xsl:key name="course_group" match="/courses/course/course_group" use="." />
    <xsl:key name="course_level" match="/courses/course/course_level" use="." />
    <xsl:key name="department" match="/courses/course/department/dept_short_name" use="." />

    <xsl:template match="courses">
        <h2>Search For Courses:</h2>
        
        <form action="searched_courses.page1.html" method="get" id="form1">
            <div><label for="keyword">Keyword Search</label>
                <input type="text" class="form-control" id="keyword" name="keyword"/></div>
            <xsl:call-template name="department"/>
            <xsl:call-template name="course_group"/>
            <xsl:call-template name="term"/>
            <xsl:call-template name="course_level"/>
            <xsl:call-template name="offered"/>
            <xsl:call-template name="day"/>
            <xsl:call-template name="start"/>
            <p><xsl:text> </xsl:text></p>
            <xsl:call-template name="mysubmit"/>  
        </form>
        
    </xsl:template>
    
    <xsl:template name="course_group">
        <div><label for="course_group">Course Group</label></div>
        <div><select id="course_group" name="course_group" class="form-control">
            <option value="" selected="selected">Any</option>
            <xsl:for-each select="/courses/course/course_group[generate-id() = generate-id(key('course_group',.)[1])]">
                <xsl:sort select="."/>
                <option value="{./@code}"><xsl:value-of select="."/></option>
            </xsl:for-each>
        </select></div>
    </xsl:template>
    
    <xsl:template name="department">
        <div><label for="department">Department</label></div>
        <div><select id="department" name="department" class="form-control">
            <option value="" selected="selected">Any</option>
            <xsl:for-each select="/courses/course/department/dept_short_name[generate-id() = generate-id(key('department',.)[1])]">
                <xsl:sort select="."/>
                <option value="{../@code}"><xsl:value-of select="."/></option>
            </xsl:for-each>
        </select></div>
    </xsl:template>
    
    <xsl:template name="term">
        <div><label for="term">Term</label></div>
        <div><select id="term" name="term" class="form-control">
            <option value="" selected="selected">Any</option>
            <option value="1">Fall</option>
            <option value="2">Spring</option>
            <option value="3">Spring Or Fall</option>
            <option value="4">Full Year</option>
        </select></div>
    </xsl:template>
    
    <xsl:template name="course_level">
        <div><label for="course_level">Course Level</label></div>
        <div><select id="course_level" name="course_level" class="form-control">
            <option value="" selected="selected">Any</option>
            <xsl:for-each select="/courses/course/course_level[generate-id() = generate-id(key('course_level',.)[1])]">
                <option value="{./@code}"><xsl:value-of select="."/></option>
            </xsl:for-each>
        </select></div>
    </xsl:template>
    
    <xsl:template name="offered">
        <div><label for="offered">Course Currently Offered</label></div>
        <div><select id="offered" name="offered" class="form-control">
            <option value="" selected="selected">Any</option>
            <option value="Y">Yes</option>
            <option value="N">No</option>
        </select></div>
    </xsl:template>
    
    <xsl:template name="day">
        <div><label for="day">Day of The Week</label></div>
        <div><select id="day" name="day" class="form-control">
            <option value="" selected="selected">Any</option>
            <option value="1">Monday</option>
            <option value="2">Tuesday</option>
            <option value="3">Wednesday</option>
            <option value="4">Thursday</option>
            <option value="5">Friday</option>
            <option value="6">Saturday</option>
        </select></div>
    </xsl:template>
    
    <xsl:template name="start">
        <div><label for="start">Start Time (24 Hour)</label></div>
        <div><select id="start" name="start" class="form-control">
            <option value="" selected="selected">Any</option>
            <xsl:for-each select="distinct-values(/courses/course/schedule/meeting/@begin_time)">
                <xsl:sort data-type="number"/>
                <option value="{.}">
                    <xsl:choose>
                        <xsl:when test="string-length(.) &lt; 4">
                            <xsl:value-of  select="concat(substring(concat('0', .),1,2),':',substring(concat('0', .),3,2))"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of  select="concat(substring(.,1,2),':',substring(.,3,2))"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </option>
            </xsl:for-each>
        </select></div>
    </xsl:template>
    
    <xsl:template name="mysubmit">
        <div><p><button type="submit" value="Submit">Submit</button></p></div>
    </xsl:template>
    
    <!-- Breadcrumbs gets called from Common -->
    <xsl:template name="breadcrumbs">
        <li>
            <a href="">
                <xsl:call-template name="arrow"/>
                <xsl:value-of select="'Search'"/>
            </a>
        </li>
    </xsl:template> 
    
</xsl:stylesheet>