<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Feb 22, 2018</xd:p>
            <xd:p><xd:b>Author:</xd:b> miapartlow</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output method="html" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <!-- <xsl:template match="journal_issue">
        <html>
            <head>
                <title>Indiana Magazine of History: <xsl:value-of select="ancestor::head"/></title>
            </head>
            <body>
           
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template> -->
    
   <!-- <xsl:template match="text">
       
        <xsl:apply-templates/>
    
    </xsl:template> -->
    
    <xsl:template match="div[@type='scholarlyArticle']">
        <xsl:variable name="number"><xsl:value-of select="@id"/></xsl:variable> 
   <xsl:result-document href="{concat('/Users/miapartlow/Desktop/IMH/', $number, '.html')}"> 
            <html>
               <head><title>Indiana Magazine of History: <xsl:value-of select="head"/></title>
               <link rel="stylesheet" type="text/css" href="IMH.css"/>
               </head>
                <body>
         <div class="article">
             <xsl:apply-templates/>
         </div>            
                </body>
            </html>
    </xsl:result-document> 
    </xsl:template>
    
    <xsl:template match="p">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="head">
        <h1><xsl:apply-templates/></h1>
    </xsl:template>
    
    <xsl:template match="teiHeader"/>
    
    <xsl:template match="hi">
        <xsl:element name="span">
            <xsl:attribute name="class"><xsl:value-of select="@rend"/></xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>     
    </xsl:template>
    
    <xsl:template match="note">
        <xsl:element name="div">
            <xsl:attribute name="class"><xsl:value-of select="@place"/></xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="list[@type='ordered']">
        <ol>
            <xsl:apply-templates/>
        </ol>
    </xsl:template>

    <xsl:template match="list[@type='bibliography']">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    
    <xsl:template match="list[@type='footnotes']">
      <ul class="footnote">    
        <xsl:apply-templates/>        
    </ul>
    </xsl:template>
    
    <xsl:template match="item">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template> 
    
    <xsl:template match="quote">
        <blockquote>
            <xsl:apply-templates/>
        </blockquote>
    </xsl:template>
    
    <xsl:template match="byline">
        <footer>
        <xsl:apply-templates/>
        </footer>
    </xsl:template>
    
    <xsl:template match="pb">
        <hr/><xsl:value-of select="$openP" disable-output-escaping="yes"/>
    </xsl:template>
    
    <xsl:variable name="openP">
        <![CDATA[
        <p>
        ]]>
    </xsl:variable>

    
</xsl:stylesheet>
