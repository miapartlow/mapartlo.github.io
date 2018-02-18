<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd" version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Feb 15, 2018</xd:p>
            <xd:p><xd:b>Author:</xd:b> miapartlow</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>
    
    
       <xsl:variable name="coaching">
            <h3>Coaching</h3>
            
            <xsl:if test="/game/team[1]/coach[@position='manager']">       
                <xsl:element name="p">
                    <xsl:element name="strong">Manager:</xsl:element>
                    <xsl:value-of select="/game/team[1]/coach[@position = 'manager']/@first"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="/game/team[1]/coach[@position = 'manager']/@last"/>
                </xsl:element>
            </xsl:if>
            
           <xsl:if test="/game/team[1]/coach[@position='batting_coach']">        
                <xsl:element name="p">
                    <xsl:element name="strong">Batting Coach:</xsl:element>
                    <xsl:value-of select="/game/team[1]/coach[@position = 'batting_coach']/@first"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="/game/team[1]/coach[@position = 'batting_coach']/@last"/>
                </xsl:element>
            </xsl:if>
            
           <xsl:if test="/game/team[1]/coach[@position='pitching_coach']">   
                <xsl:element name="p">
                    <xsl:element name="strong">Pitching Coach:</xsl:element>
                    <xsl:value-of select="/game/team[1]/coach[@position = 'pitching_coach']/@first"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="/game/team[1]/coach[@position = 'pitching_coach']/@last"/>
                </xsl:element>
            </xsl:if>
            
           <xsl:if test="/game/team[1]/coach[@position='first_base_coach']">   
                <xsl:element name="p">
                    <xsl:element name="strong">First Base Coach:</xsl:element>
                    <xsl:value-of select="/game/team[1]/coach[@position = 'first_base_coach']/@first"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="/game/team[1]/coach[@position = 'first_base_catcher']/@last"/>
                </xsl:element>
            </xsl:if>
            
           <xsl:if test="/game/team[1]/coach[@position='third_base_coach']">   
                <xsl:element name="p">
                    <xsl:element name="strong">Third Base Coach:</xsl:element>
                    <xsl:value-of select="/game/team[1]/coach[@position = 'third_base_coach']/@first"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="/game/team[1]/coach[@position = 'third_base_catcher']/@last"/>
                </xsl:element>
            </xsl:if>
            
            
            <xsl:if test="/game/team[2]/coach[@position='manager']">       
                <xsl:element name="p">
                    <xsl:element name="strong">Manager:</xsl:element>
                    <xsl:value-of select="/game/team[2]/coach[@position = 'manager']/@first"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="/game/team[2]/coach[@position = 'manager']/@last"/>
                </xsl:element>
            </xsl:if>
            
           <xsl:if test="/game/team[2]/coach[@position='batting_coach']">        
                <xsl:element name="p">
                    <xsl:element name="strong">Batting Coach:</xsl:element>
                    <xsl:value-of select="/game/team[2]/coach[@position = 'batting_coach']/@first"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="/game/team[2]/coach[@position = 'batting_coach']/@last"/>
                </xsl:element>
            </xsl:if>
            
           <xsl:if test="/game/team[2]/coach[@position='pitching_coach']">   
                <xsl:element name="p">
                    <xsl:element name="strong">Pitching Coach:</xsl:element>
                    <xsl:value-of select="/game/team[2]/coach[@position = 'pitching_coach']/@first"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="/game/team[2]/coach[@position = 'pitching_coach']/@last"/>
                </xsl:element>
            </xsl:if>
            
           <xsl:if test="/game/team[2]/coach[@position='first_base_coach']">   
                <xsl:element name="p">
                    <xsl:element name="strong">First Base Coach:</xsl:element>
                    <xsl:value-of select="/game/team[2]/coach[@position = 'first_base_coach']/@first"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="/game/team[2]/coach[@position = 'first_base_catcher']/@last"/>
                </xsl:element>
            </xsl:if>
            
           <xsl:if test="/game/team[2]/coach[@position='third_base_coach']">   
                <xsl:element name="p">
                    <xsl:element name="strong">Third Base Coach:</xsl:element>
                    <xsl:value-of select="/game/team[2]/coach[@position = 'third_base_coach']/@first"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="/game/team[2]/coach[@position = 'third_base_catcher']/@last"/>
                </xsl:element>
            </xsl:if>
            
        </xsl:variable>
    
  
    <xsl:variable name="tableHTML">
        <tr>
            <th>Player</th>
            <th>Number</th>
            <th>Batting Average</th>
            <th>RBI</th>
            <th>ERA</th>
        </tr>
    </xsl:variable>
    
    <xsl:strip-space elements="*"/>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="game">
        <html>
            <head>
                <title>Baseball Game</title>
            </head>
            <body>
                <h1>
                    <xsl:value-of select="team[1]/@name"/> vs. <xsl:value-of select="team[2]/@name"
                    />
                </h1>
                <p>
                    <xsl:value-of select="@date"/>
                </p>
                <p>Final Score: 3-4</p>

                <xsl:apply-templates/>
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
                    <xsl:sort select="@avg"/>
                </xsl:apply-templates>
            </table>
           <xsl:copy-of select="$coaching"/>
        </div>
    </xsl:template>
 

    <xsl:template match="team[2]">
        <div class="NY">
            <h2>
                <xsl:value-of select="@name"/>
            </h2>
            <table>
                <xsl:copy-of select="$tableHTML"/>
                <xsl:apply-templates select="player">
                    <xsl:sort select="@avg"/>
                </xsl:apply-templates>
            </table>
            <xsl:copy-of select="$coaching"/>
            
        </div>        
    </xsl:template>
    
    <xsl:template match="umpire"/>
  
    
    
    
    <xsl:template match="player">
        <tr>
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

    <!--
    <xsl:template match="player">
        <div class="players">
            <p>
            <xsl:apply-templates select="."/>
            <xsl:call-template name="rbi">
                <xsl:with-param name="rbiSum"/>
            </xsl:call-template>
            </p>
        </div>
    </xsl:template>
    -->


    <!--  <xsl:template name="rbi">
        <xsl:param name="rbiSum"/>
        <xsl:choose>
            <xsl:when test="contains($rbiSum, '@rbi > 0')">
                <xsl:call-template name="rbi">
                    <xsl:with-param name="rbiSum" select="@rbi > 0"/>
                </xsl:call-template>
             
            </xsl:when>
            <xsl:when test="@rbi > 0">    
                    <xsl:value-of select="sum(@rbi)"/>             
            </xsl:when>
        </xsl:choose>
    </xsl:template> -->

</xsl:stylesheet>
