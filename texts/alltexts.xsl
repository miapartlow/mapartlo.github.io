<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:html="http://www.w3.org/1999/xhtml" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs xd" version="1.0">
    <xsl:template match="tei:TEI">
<xsl:text>---&#10;</xsl:text>
<xsl:text>layout: default&#10;</xsl:text>
<xsl:text>title: "Friends of Prison Reform"&#10;</xsl:text>
<xsl:text>---&#10;</xsl:text>
        <div class="body">
            <xsl:apply-templates/>
        </div>
        <div class="citation">
            <h4>Citations</h4>
            <h5>MLA</h5>
            <p>
                <xsl:value-of
                    select="tei:teiHeader/fileDesc/sourceDesc/biblStruct/monogr/author/persName/surname"/>, <xsl:value-of
                        select="tei:teiHeader/fileDesc/sourceDesc/biblStruct/monogr/author/persName/forename"/>. <i><xsl:value-of
                            select="tei:teiHeader/fileDesc/sourceDesc/biblStruct/monogr/title[@type = 'main']"/></i>. <xsl:value-of
                                select="tei:teiHeader/fileDesc/sourceDesc/biblStruct/monogr/imprint/pubPlace"/>: <xsl:value-of
                                    select="tei:teiHeader/fileDesc/sourceDesc/biblStruct/monogr/imprint/publisher"/>. </p> <h5>APA</h5>
            <h5>Chicago</h5>
        </div>
        
    </xsl:template>
    
    <xsl:template match="tei:teiHeader"/>
    
    <xsl:template match="tei:div">
        <div class="{@type}" id="{@xml:id}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    
    <xsl:template match="tei:p">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
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
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:docAuthor">
        <p class="author">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:docImprint">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:pubPlace | publisher">
        <p class="imprint">
            <xsl:apply-templates/>
        </p>
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
        <html:p>
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
