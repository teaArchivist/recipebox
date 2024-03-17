<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Recipe Box</title>
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
                <h2>Recipe Boxes and Recipes</h2>
                <table>
                    <tr>
                        <th>Recipe Box ID</th>
                        <th>Recipe Names</th>
                        <th>Ingredients</th>
                    </tr>
                    <xsl:for-each select="//recipebox[recipes/recipe]">
                        <xsl:sort select="@id" data-type="number" order="ascending"/>
                        <tr>
                            <td><xsl:value-of select="@id"/></td>
                            <td>
                                <ul>
                                    <xsl:for-each select="recipes/recipe">
                                        <li>
                                            <xsl:value-of select="//recipes/recipe[@id=current()/@idref]/title"/>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </td>
                            <td>
                                <ul>
                                    <xsl:for-each select="recipes/recipe">
                                        <xsl:variable name="recipeId" select="@idref"/>
                                        <xsl:for-each select="//recipes/recipe[@id=$recipeId]/information/ingredients/ingredient">
                                            <li>
                                                <xsl:value-of select="concat(amount, ' ', unit/@idref, ' ', translate(//ingredients/ingredient[@id=current()/@idref]/name, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'))"/>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </ul>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
