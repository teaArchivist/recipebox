<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

    <!--Create a key to link comments in recipe to comment-->
    <xsl:key name="recipe-comments" match="comment" use="@recipe"/>

    <!-- Root Template -->
    <xsl:template match="/">
        <recipeboxes>
            <table border="1">
                <tr>
                    <th>Rank</th>
                    <th>Title</th>
                    <th>Average Rating</th>
                </tr>
                <!-- Apply sorting and calculate average rating -->
                <xsl:for-each select="//recipes/recipe[.//comment]">
                    <!-- Group recipes by ID -->
                    <xsl:sort select="sum(key('recipe-comments', @id)/rating) div count(key('recipe-comments', @id))" data-type="number" order="descending"/>
                    <!-- Calculate average rating -->
                    <xsl:variable name="recipeId" select="@id"/>
                    <xsl:variable name="comments" select="//user_feedback/comment[recipe/@idref = $recipeId]"/>
                    <xsl:variable name="totalRatings" select="sum($comments/rating)"/>
                    <xsl:variable name="averageRating" select="format-number($totalRatings div count($comments), '0.00')"/>
                    <!-- Output recipe details -->
                    <tr>
                        <td><xsl:number value="position()"/></td>
                        <td><xsl:value-of select="title"/></td>
                        <td><xsl:value-of select="$averageRating"/></td>
                    </tr>
                </xsl:for-each>
            </table>
        </recipeboxes>
    </xsl:template>

</xsl:stylesheet>
