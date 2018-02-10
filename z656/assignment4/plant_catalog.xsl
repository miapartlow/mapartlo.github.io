<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd" version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Feb 9, 2018</xd:p>
            <xd:p><xd:b>Author:</xd:b> miapartlow</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>

    <xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="CATALOG">
        <html>
            <head>
                <title>Plant Catalog</title>
                <link rel="stylesheet" href="plant_catalog.css"/>
            </head>
            <body>
                <img src="flowers.png"/>
                <h1 class="catalog">Plant Catalog</h1>
                <table>
                    <tr>
                        <th>Common Name</th>
                        <th>Latin Name</th>
                        <th>Zone</th>
                        <th>Light</th>
                        <th>Price</th>
                        <th>Availability</th>
                    </tr>
                    <xsl:apply-templates/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="PLANT">
        <tr>
            <xsl:apply-templates/>
        </tr>
    </xsl:template>

    <xsl:template match="COMMON">
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>

    <xsl:template match="BOTANICAL">
        <td>
            <i>
            <xsl:apply-templates/>
            </i>
        </td>
    </xsl:template>

    <xsl:template match="ZONE">

        <td class="zone">
            <xsl:apply-templates/>
        </td>

    </xsl:template>

    <xsl:template match="LIGHT">

        <td>
            <xsl:apply-templates/>
        </td>

    </xsl:template>

    <xsl:template match="PRICE">

        <td>
            <xsl:apply-templates/>
        </td>

    </xsl:template>

    <xsl:template match="AVAILABILITY">

        <td>
            <xsl:apply-templates/>
        </td>

    </xsl:template>

</xsl:stylesheet>
