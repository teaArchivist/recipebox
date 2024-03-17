<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <html>
            <head>
                <title>Low Glycemic Recipes</title>
                <style>
                    table {
                        border-collapse: collapse;
                        width: 100%;
                    }
                    th, td {
                        border: 1px solid #dddddd;
                        text-align: left;
                        padding: 8px;
                    }
                    th {
                        background-color: #f2f2f2;
                    }
                </style>
            </head>
            <body>
                <h2>Here is the list of <xsl:value-of select="count(//recipes/recipe[information/value_information/nutrition/nutr_value[@idref='sugar' and . &lt; 5]])"/> low-sugar recipes</h2>

                <table>
                    <tr>
                        <th>Recipe Title</th>
                        <th>Sugar Content (g)</th>
                    </tr>
                    <xsl:for-each select="//recipes/recipe[information/value_information/nutrition/nutr_value[@idref='sugar' and . &lt; 5]]">
                        <xsl:sort select="information/value_information/nutrition/nutr_value[@idref='sugar']" data-type="number" order="ascending"/>
                        <tr>
                            <td><xsl:value-of select="title"/></td>
                            <td><xsl:value-of select="information/value_information/nutrition/nutr_value[@idref='sugar']"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>