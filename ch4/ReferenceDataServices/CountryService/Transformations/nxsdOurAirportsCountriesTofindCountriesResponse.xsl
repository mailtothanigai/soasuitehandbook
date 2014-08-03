<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:ns0="/reference/nxsd_OurAirportsCountries"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:tns="saibot.airport/services/utility/reference"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd ns0 tns oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:nxsd="http://xmlns.oracle.com/pcbpel/nxsd" xmlns:refData="saibot.airport/data/reference"
                xmlns:common="saibot.airport/data/common">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/nxsd_OurAirportCountries.xsd"/>
        <oracle-xsl-mapper:rootElement name="Countries" namespace="/reference/nxsd_OurAirportsCountries"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/CountryService.xsd"/>
        <oracle-xsl-mapper:rootElement name="findCountriesResponseMessage"
                                       namespace="saibot.airport/services/utility/reference"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [SAT AUG 02 23:51:00 CEST 2014].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:param name="continent"/>
  <xsl:param name="countryName"/>
  <xsl:param name="countryCode"/>
  <xsl:template match="/">
    <tns:findCountriesResponseMessage>
      <tns:Countries>
        <xsl:for-each select="/ns0:Countries/ns0:Country[(($countryName= '*') or starts-with(ns0:name,$countryName)) and (($countryCode= '*') or starts-with(ns0:code,$countryCode)) and (($continent= '*') or ns0:continent=$continent)]">
          <tns:Country>
            <refData:code>
              <xsl:value-of select="ns0:code"/>
            </refData:code>
            <refData:name>
              <xsl:value-of select="ns0:name"/>
            </refData:name>
          </tns:Country>
        </xsl:for-each>
      </tns:Countries>
    </tns:findCountriesResponseMessage>
  </xsl:template>
</xsl:stylesheet>
