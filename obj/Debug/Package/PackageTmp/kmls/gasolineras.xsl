<?xml version="1.0" encoding="utf-8"?>
<!-- DWXMLSource="gasolineras.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8"/>
<xsl:template match="/">
  <gasolineras>
    <xsl:for-each select="params">
      <longitud>
        <xsl:value-of select="gasolineras/gasolinera/longitud"/>
      </longitud>
    </xsl:for-each >
    <latitud>
<xsl:value-of select="gasolineras/gasolinera/latitud"/>
      </latitud>
    </gasolineras>
</xsl:template>
</xsl:stylesheet>