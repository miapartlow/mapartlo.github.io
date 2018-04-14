<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:html="http://www.w3.org/1999/xhtml" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs xd" version="1.0">

    <xsl:output indent="yes" method="html"/>
    <xsl:template match="tei:TEI">
        <xsl:variable name="surname-var">
            <xsl:value-of
                select="./tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:author/tei:persName/tei:surname"
            />
        </xsl:variable>
        <xsl:variable name="forename-var">
            <xsl:value-of
                select="./tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:author/tei:persName/tei:forename"
            />
        </xsl:variable>
        <xsl:variable name="titleMain-var">
            <xsl:value-of
                select="./tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:title[@type = 'main']"
            />
        </xsl:variable>
        <xsl:variable name="pubPlace-var">
            <xsl:value-of
                select="./tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:pubPlace"
            />
        </xsl:variable>
        <xsl:variable name="publisher-var">
            <xsl:value-of
                select="./tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:publisher"
            />
        </xsl:variable>

        <xsl:variable name="date-var">
            <xsl:value-of
                select="./tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:date"
            />
        </xsl:variable>
        <xsl:variable name="ex">
            <xsl:text disable-output-escaping="yes"><![CDATA[&times;]]></xsl:text>
        </xsl:variable>
        <html>
            <head>
                <title>
                    <xsl:value-of select="./tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </title>
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

                <h2 class="title">
                    <xsl:value-of
                        select="tei:text/tei:front/tei:titlePage/tei:docTitle/tei:titlePart"/>
                </h2>
                <h4 class="author"><xsl:value-of select="tei:text/tei:front/tei:titlePage/tei:docAuthor"/></h4>

                <div class="citation">

                    <!--demo modal -->

                    <!-- Trigger/Open The Modal -->
                    <button id="myBtn">Cite this book</button>

                    <!-- The Modal -->
                    <div id="myModal" class="modal">

                        <!-- Modal content -->
                        <div class="modal-content">
                            <span class="close">x</span>
                            <h5>MLA</h5>
                            <p>
                                <xsl:value-of select="$surname-var"/>, <xsl:value-of
                                    select="$forename-var"/>. <i><xsl:value-of
                                        select="$titleMain-var"/></i>. <xsl:value-of
                                    select="$pubPlace-var"/>: <xsl:value-of select="$publisher-var"
                                />, <xsl:value-of select="$date-var"/>. </p>
                            <h5>APA</h5>
                            <!--Author, A. A. (Year of publication). Title of work: Capital letter also for subtitle. Location: Publisher-->
                            <xsl:element name="p"><xsl:value-of select="$surname-var"/>,
                                    <xsl:value-of
                                    select="substring(./tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:author/tei:persName/tei:forename, 1, 1)"
                                />. (<xsl:value-of select="$date-var"/>). <i><xsl:value-of
                                        select="./tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:title[@type = 'apa']"
                                    /></i>. <xsl:value-of select="$pubPlace-var"/>: <xsl:value-of
                                    select="$publisher-var"/>. </xsl:element>

                            <h5>Chicago</h5>

                            <p xmlns="http://www.w3.org/1999/xhtml">
                                <!--Last name, First name. Title of Book. Place of publication: Publisher, Year of publication. -->
                                <xsl:value-of select="$surname-var"/>, <xsl:value-of
                                    select="$forename-var"/>. <i><xsl:value-of
                                        select="$titleMain-var"/></i>. <xsl:value-of
                                    select="$pubPlace-var"/>: <xsl:value-of select="$publisher-var"
                                />, <xsl:value-of select="$date-var"/>. </p>
                        </div>

                    </div>



                    <script>
                        
                        var modal = document.getElementById('myModal');
                        
                        
                        var btn = document.getElementById("myBtn");
                        
                        
                        var span = document.getElementsByClassName("close")[0];
                        
                        
                        btn.onclick = function() {
                        modal.style.display = "block";
                        }
                        
                        
                        span.onclick = function() {
                        modal.style.display = "none";
                        }
                        
                        
                        window.onclick = function(event) {
                        if (event.target == modal) {
                        modal.style.display = "none";
                        }
                        }
                    </script>

                    <!-- end of demo modal -->
                    <html:div class="document">
                        <xsl:apply-templates/>
                        <xsl:if test="count(//tei:note) > 0">
                            <html:hr/>
                            <html:div class="footnotes">
                                <xsl:apply-templates select="//tei:note" mode="endlist"/>
                            </html:div>
                            <!-- end endnotes div -->
                        </xsl:if>
                    </html:div>


                </div>

            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:teiHeader"/>

    <xsl:template match="tei:div">
        <div class="{@type}" id="{@xml:id}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:div[@type = 'toc']">
        <div class="{@type}" id="{@xml:id}">
            <h3>Table of Contents</h3>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:head">
        <h4>
            <xsl:apply-templates/>
        </h4>
    </xsl:template>


    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:front">
        <div class="frontmatter">
            <xsl:apply-templates/>
        </div>
    </xsl:template>


    <xsl:template match="tei:docTitle"/>
    <!--
  <xsl:apply-templates/>
        
    </xsl:template> -->

    <xsl:template match="tei:titlePage"/>

    <!--
        <div class="title">
          
            <xsl:apply-templates/>
            
        </div>
    </xsl:template>
-->

    <xsl:template match="tei:titlePart"/>

    <!--  <p>
            <i>
            <xsl:apply-templates/>
            </i>
       </p>
    </xsl:template> -->

    <xsl:template match="tei:docAuthor">
        <xsl:element name="p">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:docImprint"/>
    
    <xsl:template match="tei:hi">
<span class="{./@rendition}">        <xsl:apply-templates/>
</span>
    </xsl:template>


    <xsl:template match="tei:pubPlace | tei:publisher | tei:date"/>

    <xsl:template match="tei:docEdition"/>

    <xsl:template match="tei:list">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>

    <xsl:template match="tei:item">
        <li>
            <a href="{tei:ptr/@target}">
                <xsl:apply-templates/>
            </a>
        </li>
    </xsl:template>

    <xsl:template match="tei:body">

        <xsl:apply-templates/>

    </xsl:template>

    <xsl:template match="tei:table">
        <table>
            <xsl:apply-templates/>
        </table>
    </xsl:template>

    <xsl:template match="tei:row">
        <tr>
            <xsl:apply-templates/>
        </tr>
    </xsl:template>

    <xsl:template match="tei:cell">
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>

<xsl:template match="tei:epigraph">
    <p><i><xsl:apply-templates/></i></p>
    
</xsl:template>
    
    <xsl:template match="tei:closer">
        <xsl:apply-templates/>
        
    </xsl:template>
    
    <xsl:template match="tei:salute">
        <p class="letter">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
         <xsl:template match="tei:dateline">
        <p class="letter">
            <xsl:apply-templates/>
        </p>
        
    </xsl:template>
    
    
    <xsl:template match="tei:signed">
        <p class="letter">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <!-- Template for footnote references, inline with the text.
    Sets up cross-references to footnote text that appears after
    the document. -->
    <xsl:template match="tei:note">
        <xsl:variable name="inc">
            <xsl:value-of select="./@n"/>
        </xsl:variable>
        <a href="#fn{$inc}" id="fnref{$inc}" class="fn">
            <sup>

                <xsl:value-of select="./@n"/>

            </sup>
            <span class="footnoteinline"><xsl:value-of select="@n"/>. <xsl:value-of select="."
                /></span>
        </a>
    </xsl:template>

    <!-- Template for footnote text that should appear following
    the document, with cross references back to where the footnote
    originally appears. -->
    <xsl:template match="tei:note" mode="endlist">
        <xsl:variable name="incr">
            <xsl:number level="any" count="tei:note"/>
        </xsl:variable>
        <p>

            <sup>
                <a href="#fnref{$incr}" id="fn{$incr}" title="Return to text">
                    <xsl:value-of select="@n"/>
                </a>
            </sup>
            <xsl:value-of select="."/>
            <xsl:text/>
        </p>
    </xsl:template>

</xsl:stylesheet>
