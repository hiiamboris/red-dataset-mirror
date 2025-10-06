<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output
        method="html"                                                                 
        encoding="utf-8"
        doctype-system="about:legacy-compat"                                          
        />

    <xsl:template match="/">
        <html lang="cs" dir="ltr">
            <head>
                <meta http-equiv="content-type" content="text/html; charset=utf-8" />
                <meta http-equiv="content-language" content="cs" />
                <meta http-equiv="content-style-type" content="text/css" />
                <title id="Header_Title">ABC</title>
                <link rel="StyleSheet" href="./menu.css" type="text/css" media="all" />
            </head>
            <body>
                <div id="global">
                    <h1>Napis</h1>
                    <div id="menu-div">
                        <ul id="myTree">
                            <xsl:apply-templates select="*" />
                        </ul>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="rootmenu">
        <xsl:call-template name="menu" />
    </xsl:template>

    <xsl:template match="rootmenu | menu" name="menu" mode="root">
        <xsl:for-each select="*">
            <li>
                <xsl:if test="position()=last()">
                    <xsl:attribute name="class">last</xsl:attribute>
                </xsl:if>
                <a> <xsl:attribute name="href">
                         <xsl:value-of select="@ref" />
                    </xsl:attribute>
                    <xsl:if test="not(@target='')">
                         <xsl:attribute name="onclick">window.open(this.href,'<xsl:value-of select="@target" />');return(false);</xsl:attribute>
                    </xsl:if>
                    <xsl:value-of select="@name" />
                </a>
                <xsl:if test="name(.)='menu'">
                    <ul>
                        <xsl:call-template name="menu" />
                    </ul>
                </xsl:if>
            </li>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>

