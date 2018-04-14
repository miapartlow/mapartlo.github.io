<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs xd"
    version="2.0">
   <xsl:output method="html"/>
    
    <!-- use author.region.dates.xml to generate "texts by author" page -->
    
  <xsl:template match="authors">
        
        <html>
            <head>
                <title>Texts by Author</title>    
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
                            <a href="/byauthor">Browse by Author</a>
                        </li>
                        <li>
                            <a href="/byregion">Browse by Region</a>
                        </li>
                        <li>
                            <a href="/about">About</a>
                        </li>
                        <li>
                            <a href="/search">Search</a>
                        </li>
                    </ul>
                </nav>
                <h1>Texts by Author</h1>
                <div class="az">
                    <p>A B <a href="#c">C</a> D E <a href="#f">F</a><xsl:text> </xsl:text><a href="#g">G</a> H I J K L M N O P Q R S T U V W X Y Z</p></div>
                
                <div class="authors">
                    <div id="c">
                        <xsl:apply-templates select="citation[@letter='C']"/>
                    </div>
                 <div id="f">
                    <xsl:apply-templates select="citation[@letter='F']"/>
                 </div>
                    <div id="g">
                        <xsl:apply-templates select="citation[@letter='G']"/>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template match="citation[@letter='F']">
       
        <!-- preface before text citation -->
        <p class="author"><b><xsl:value-of select="forename"/><xsl:text> </xsl:text><xsl:value-of select="surname"/></b></p>
        <p class="author"><xsl:value-of select="birth"/>-<xsl:value-of select="death"/>. <xsl:value-of select="placeName[1]"/>, <xsl:value-of select="placeName[2]"/> 
        </p> 
        
        <!-- text citation -->
        <!--need to add link! -->
              <p class="citation"><a href="http://mapartlo.github.io/texts/{surname}.xml">  <xsl:value-of select="surname"/>, <xsl:value-of select="forename"/>. <i><xsl:value-of select="title"/></i>. <xsl:value-of select="pubPlace"/>: <xsl:value-of select="publisher"/>: <xsl:value-of select="date"/>.</a>
               </p>      
    </xsl:template>

    <xsl:template match="citation[@letter='C']">
        <!-- preface before text citation -->
  
        <p class="author"><b><xsl:value-of select="forename"/><xsl:text> </xsl:text><xsl:value-of select="surname"/></b></p>
        <p class="author"><xsl:value-of select="birth"/>-<xsl:value-of select="death"/>. <xsl:value-of select="placeName[1]"/>, <xsl:value-of select="placeName[2]"/>. 
        </p> 
        
        <!-- text citation -->
        <!--need to add link! -->
        
        <p class="citation"><a href="http://mapartlo.github.io/texts/{surname}.xml">   <xsl:value-of select="surname"/>, <xsl:value-of select="forename"/>. <i><xsl:value-of select="title"/></i>. <xsl:value-of select="pubPlace"/>: <xsl:value-of select="publisher"/>: <xsl:value-of select="date"/>.</a>
        </p>
    </xsl:template>
    
    <xsl:template match="citation[@letter='G']">
       
        <!-- preface before text citation -->
        <p class="author"><b><xsl:value-of select="forename"/><xsl:text> </xsl:text><xsl:value-of select="surname"/></b></p>
        <p class="author"><xsl:value-of select="birth"/>-<xsl:value-of select="death"/>. <xsl:value-of select="placeName[1]"/>, <xsl:value-of select="placeName[2]"/>. 
        </p> 
        
        <!-- text citation -->
        <!--need to add link! -->
        <p class="citation"><a href="http://mapartlo.github.io/texts/{surname}.xml">  <xsl:value-of select="surname"/>, <xsl:value-of select="forename"/>. <i><xsl:value-of select="title"/></i>. <xsl:value-of select="pubPlace"/>: <xsl:value-of select="publisher"/>: <xsl:value-of select="date"/>.</a>
        </p>
    </xsl:template>
    
    
</xsl:stylesheet>