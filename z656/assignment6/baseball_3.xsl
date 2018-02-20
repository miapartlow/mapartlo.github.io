<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:functx="http://www.functx.com" exclude-result-prefixes="xs xd" version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Feb 15, 2018</xd:p>
            <xd:p><xd:b>Author:</xd:b> miapartlow</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>
    
    <xsl:strip-space elements="*"/>
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:function name="functx:capitalize-first" as="xs:string?"
        xmlns:functx="http://www.functx.com">
        <xsl:param name="arg" as="xs:string?"/>
        <xsl:sequence
            select="
            concat(upper-case(substring($arg, 1, 1)),
            substring($arg, 2))"/>
    </xsl:function>
    
    <xsl:variable name="avg_batting_1">
        <xsl:value-of
            select="sum(/game/team[1]/player[@position != 'P']/@avg) div count(/game/team[1]/player[@position != 'P'])"
        />
    </xsl:variable>
    
    <xsl:variable name="avg_batting_2">
        <xsl:value-of
            select="sum(/game/team[2]/player[@position != 'P']/@avg) div count(/game/team[2]/player[@position != 'P'])"
        />
    </xsl:variable>
    
    <xsl:variable name="tableHTML">
        <tr>
            <th class="bb">Player</th>
            <th class="bb">Number</th>
            <th class="bb">Batting Average</th>
            <th class="bb">RBI</th>
            <th class="bb">ERA</th>
        </tr>
    </xsl:variable>
    
    <xsl:template match="game">
        <html>
            <head>
                <title>Baseball Game</title>
                 <link rel="stylesheet" type="text/css" href="../../css/main.css"/> 
            </head>
            <body>
                <h1>
                    <xsl:value-of select="team[1]/@name"/> vs. <xsl:value-of select="team[2]/@name"
                    />
                </h1>
                <p>
                    <i>
                        <xsl:value-of select="@date"/>
                    </i>
                </p>
                <p>
                    <i>Final Score: 3-4</i>
                </p>
                <div class="ump">
                    <h4>Game Umpires</h4>
                    
                    <xsl:apply-templates select="umpires"/>
                    
                </div> 
                <xsl:apply-templates select="team"/>
                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="team[1]">
       
        <div class="Minn">
            <h2>
                <xsl:value-of select="@name"/>
            </h2>
            
            <table>
                <xsl:copy-of select="$tableHTML"/>
                <xsl:apply-templates select="player">
                    <xsl:sort select="@avg" order="descending"/>
                </xsl:apply-templates>
            </table>
            <div class="avg">
            <p>
                <i>Overall batting average for the <xsl:value-of select="/game/team[1]/@name"/> is
                    <xsl:value-of select="$avg_batting_1"/></i>
            </p>
            </div>
            <div class="coach">
                <h4>Minnesota Twins Coaching</h4>
                
                <xsl:apply-templates select="coach"/>
                
            </div>
        </div>
    </xsl:template>
    
    
    <xsl:template match="team[2]">        
        <hr/>
      
        <div class="NY">
           
            <h2>
                <xsl:value-of select="@name"/>
            </h2>
            <table>
                <xsl:copy-of select="$tableHTML"/>
                <xsl:apply-templates select="player">
                    <xsl:sort select="@avg" order="descending"/>
                </xsl:apply-templates>
            </table>
            <div class="avg">
            <p class="bb">
                <i>Overall batting average for the <xsl:value-of select="/game/team[2]/@name"/> is
                    <xsl:value-of select="$avg_batting_2"/></i>
            </p>
            </div>
            <div class="coach">
                
                <h4>New York Yankees Coaching</h4>
                <xsl:apply-templates select="coach"/>
            </div>
        </div>
        
    </xsl:template>
    
    <xsl:template match="player">
        <tr class="bb">
            <td>
                <xsl:value-of select="@last"/>, <xsl:value-of select="@first"/>
            </td>
            <td>
                <xsl:value-of select="@num"/>
            </td>
            <td>
                <xsl:value-of select="@avg"/>
            </td>
            
            <td>
                <xsl:value-of select="@rbi"/>
            </td>
            <td>
                <xsl:value-of select="@era"/>
            </td>
        </tr>
    </xsl:template>
    
    <xsl:template match="coach">
        <xsl:element name="p">
            <xsl:attribute name="class">bb</xsl:attribute>
            <xsl:value-of select="functx:capitalize-first(translate(@position, '_', ' '))"/>
            <xsl:text>:  </xsl:text>
            <xsl:value-of select="@first"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="@last"/>
        </xsl:element>
        
    </xsl:template>
    
    <xsl:template match="umpires">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="umpire">
        <xsl:element name="p">
            <xsl:attribute name="class">bb</xsl:attribute>
            <xsl:value-of select="@name"/>
        </xsl:element>
    </xsl:template> 
</xsl:stylesheet>
