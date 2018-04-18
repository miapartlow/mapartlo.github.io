<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd"
    version="2.0">
   <xsl:output method="html"/>
    
    <!-- use author.region.dates.xml to generate "texts by region" page --> 
   
  <xsl:template match="authors">
        
        <html>
            <head>
                <title>Texts by Region</title>   
           <link rel="stylesheet" type="text/css" href="../css/main.css"/> 
            </head>
            
            <body>
                
                <h1>Friends of Prison Reform</h1>
                <nav>
                    <ul>
                        <li>
                            <a href="/">Home</a>
                        </li>
                        <li>
                            <a href="/byauthor/authors.xml">Browse by Author</a>
                        </li>
                        <li>
                            <a href="/byregion/regions.xml">Browse by Region</a>
                        </li>
                        <li>
                            <a href="/about">About</a>
                        </li>
                        <li>
                            <a href="/search">Search</a>
                        </li>
                    </ul>
                </nav>
                   <h1>Texts by Region</h1>
        <p class="region"> <a href="#eu">Europe</a> | <a href="#us">United States</a></p>
      
         <h3 id="us">    <xsl:text>United States</xsl:text></h3> 
            <p> <xsl:apply-templates select="citation[placeName[2]='United States']"><xsl:sort select="placeName[1]" order="ascending"/></xsl:apply-templates>
            </p>
        
               
                    <h3 id="eu" class="region">Europe</h3>
                    <h4 class="country">England</h4>
                    <xsl:apply-templates select="citation[placeName[2]='England']"><xsl:sort select="placeName[2]" order="ascending"/></xsl:apply-templates>
         
            </body>
        </html>
    </xsl:template>
  
    <xsl:template match="citation[placeName[2]='United States']">
     
            <h4 class="country"><xsl:value-of select="placeName[1]"/></h4>
        <p><a href="http://mapartlo.github.io/texts/{surname}.xml"> <xsl:value-of select="surname"/>, <xsl:value-of select="forename"/>. <i><xsl:value-of select="title"/></i>. <xsl:value-of select="pubPlace"/>: <xsl:value-of select="publisher"/>, <xsl:value-of select="date"/>.</a></p>
        
    </xsl:template>
    
    <xsl:template match="citation[placeName[2]='England']">
        <p> 
         
            <a href="http://mapartlo.github.io/texts/{surname}.xml"> <xsl:value-of select="surname"/>, <xsl:value-of select="forename"/>. <i><xsl:value-of select="title"/></i>. <xsl:value-of select="pubPlace"/>: <xsl:value-of select="publisher"/>, <xsl:value-of select="date"/>.</a>
        </p>
    </xsl:template>
    
</xsl:stylesheet>
