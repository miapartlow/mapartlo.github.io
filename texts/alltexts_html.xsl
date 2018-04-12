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
    <xsl:value-of select="./tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:date"/>
</xsl:variable>

        <html>
            <head>
                <title>
                    <xsl:value-of select="./tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </title>
                <link rel="stylesheet" type="text/css" href="/css/main.css"/>
            </head>
            <body>
                <h1>Friends of Prison Reform</h1>
                <nav>
                    <ul>
                        <li><a href="/">Home</a></li>
                        <li><a href="/byauthor">Browse by Author</a></li>
                        <li><a href="/byregion">Browse by Region</a></li>
                        <li><a href="/about">About</a></li>
                        <li><a href="/search">Search</a></li>
                    </ul>
                </nav>
                
                <xsl:apply-templates/>
            </body>
            <div class="citation">
                <h4>Citations</h4>
                <h5>MLA</h5>
                <html:p xml-default-namespace="http://www.w3.org/1999/xhtml">
                    <xsl:value-of select="$surname-var"/>, <xsl:value-of select="$forename-var"/>.
                            <i><xsl:value-of select="$titleMain-var"/></i>. <xsl:value-of select="$pubPlace-var"/>: <xsl:value-of select="$publisher-var"/>, <xsl:value-of select="$date-var"/>. </html:p>
                <h5>APA</h5>
                <!--Author, A. A. (Year of publication). Title of work: Capital letter also for subtitle. Location: Publisher-->
                <xsl:element name="p"><xsl:value-of select="$surname-var"/>, <xsl:value-of
                    select="substring(./tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:author/tei:persName/tei:forename, 1, 1)"
                />. (<xsl:value-of select="$date-var"/>). <i><xsl:value-of select="./tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:title[@type = 'apa']" /></i>. <xsl:value-of select="$pubPlace-var"/>: <xsl:value-of select="$publisher-var"/>.
                </xsl:element>
                
                <h5>Chicago</h5>
                <p xmlns="http://www.w3.org/1999/xhtml">
                    <!--Last name, First name. Title of Book. Place of publication: Publisher, Year of publication. -->
                    <xsl:value-of select="$surname-var"/>, <xsl:value-of select="$forename-var"/>. <i><xsl:value-of select="$titleMain-var"/></i>. <xsl:value-of select="$pubPlace-var"/>: <xsl:value-of select="$publisher-var"/>, <xsl:value-of select="$date-var"/>. 
                </p>
            </div>
        </html>
    </xsl:template>

    <xsl:template match="tei:teiHeader"/>

    <xsl:template match="tei:div">
        <div class="{@type}" id="{@xml:id}">
            <xsl:apply-templates/>
        </div>
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

    <xsl:template match="tei:docTitle">
        <div class="title">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:titlePart">
     <xsl:element name="p">
            <xsl:apply-templates/>
     </xsl:element>
    </xsl:template>

    <xsl:template match="tei:docAuthor">
      <xsl:element name="p">
            <xsl:apply-templates/>
      </xsl:element>
    </xsl:template>

    <xsl:template match="tei:docImprint">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:pubPlace | publisher">
        <xsl:element name="p">
            <xsl:attribute name="class">imprint</xsl:attribute>
       
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:list">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>

    <xsl:template match="tei:item">
        <li>
            <a href="#{tei:ptr/@target}">
                <xsl:apply-templates/>
            </a>
        </li>
    </xsl:template>



    <!--footnote xsl by Joe Wicentowski, https://wiki.tei-c.org/index.php/PopUpFootNotes.xsl -->
    <!-- The 'document' template. Sets up an HTML div tag to surround the
    resulting document.  Inside goes the document, and if the document
    contains footnotes, it runs the 'tei:note endlist' template, which puts
    a copy of the footnotes inside a div tag after the document. -->
    <xsl:template name="document">
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
        <!-- end document div -->
    </xsl:template>

    <!-- Template for footnote references, inline with the text.
    Sets up cross-references to footnote text that appears after
    the document. -->
    <xsl:template match="tei:note">
        <xsl:variable name="inc">
            <xsl:number level="any" count="tei:note"/>
        </xsl:variable>
        <html:a href="#fn{$inc}" name="fnref{$inc}">
            <html:sup>
                <xsl:value-of select="@n"/>
            </html:sup>
            <html:span class="footnoteinline"><xsl:value-of select="@n"/>. <xsl:value-of select="."
                /></html:span>
        </html:a>
    </xsl:template>

    <!-- Template for footnote text that should appear following
    the document, with cross references back to where the footnote
    originally appears. -->
    <xsl:template match="tei:note" mode="endlist">
        <xsl:variable name="incr">
            <xsl:number level="any" count="tei:note"/>
        </xsl:variable>
    <html:p xmlns="http://www.w3.org/1999/xhtml">
            <html:a href="#fnref{$incr}" name="fn{$incr}" title="Return to text">
                <html:sup>
                    <xsl:value-of select="@n"/>
                </html:sup>
            </html:a>
            <xsl:value-of select="."/>
            <xsl:text/>
    </html:p>
    </xsl:template>
</xsl:stylesheet>
