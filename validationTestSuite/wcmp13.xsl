<?xml version="1.0"?>
<axsl:stylesheet xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmx="http://www.isotc211.org/2005/gmx" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0">
<axsl:param name="archiveDirParameter"/><axsl:param name="archiveNameParameter"/><axsl:param name="fileNameParameter"/><axsl:param name="fileDirParameter"/>





<axsl:output xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:svrl="http://purl.oclc.org/dsdl/svrl" method="html"/>









<axsl:template match="*" mode="schematron-select-full-path"><axsl:apply-templates select="." mode="schematron-get-full-path"/></axsl:template>



<axsl:template match="*" mode="schematron-get-full-path"><xsl:apply-templates xmlns:xsl="http://www.w3.org/1999/XSL/Transform" select="parent::*" mode="schematron-get-full-path"/><xsl:text xmlns:xsl="http://www.w3.org/1999/XSL/Transform">/ </xsl:text><xsl:value-of xmlns:xsl="http://www.w3.org/1999/XSL/Transform" select="name()"/><xsl:variable xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="ord" select="&#10;      1 + count(preceding-sibling::*[local-name()=local-name(current())])&#10;      "/><xsl:if xmlns:xsl="http://www.w3.org/1999/XSL/Transform" test="&#10;      $ord &gt; 1 or following-sibling::*[local-name()=local-name(current())]&#10;      ">
      [<xsl:value-of select="$ord"/>]
    </xsl:if></axsl:template><axsl:template match="@*" mode="schematron-get-full-path"><axsl:text>/</axsl:text><axsl:choose><axsl:when test="namespace-uri()=''">@<axsl:value-of select="name()"/></axsl:when><axsl:otherwise><axsl:text>@*[local-name()='</axsl:text><axsl:value-of select="local-name()"/><axsl:text>' and namespace-uri()='</axsl:text><axsl:value-of select="namespace-uri()"/><axsl:text>']</axsl:text></axsl:otherwise></axsl:choose></axsl:template>



<axsl:template match="node() | @*" mode="schematron-get-full-path-2"><axsl:for-each select="ancestor-or-self::*"><axsl:text>/</axsl:text><axsl:value-of select="name(.)"/><axsl:if test="preceding-sibling::*[name(.)=name(current())]"><axsl:text>[</axsl:text><axsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/><axsl:text>]</axsl:text></axsl:if></axsl:for-each><axsl:if test="not(self::*)"><axsl:text/>/@<axsl:value-of select="name(.)"/></axsl:if></axsl:template>


<axsl:template match="/" mode="generate-id-from-path"/><axsl:template match="text()" mode="generate-id-from-path"><axsl:apply-templates select="parent::*" mode="generate-id-from-path"/><axsl:value-of select="concat('.text-', 1+count(preceding-sibling::text()), '-')"/></axsl:template><axsl:template match="comment()" mode="generate-id-from-path"><axsl:apply-templates select="parent::*" mode="generate-id-from-path"/><axsl:value-of select="concat('.comment-', 1+count(preceding-sibling::comment()), '-')"/></axsl:template><axsl:template match="processing-instruction()" mode="generate-id-from-path"><axsl:apply-templates select="parent::*" mode="generate-id-from-path"/><axsl:value-of select="concat('.processing-instruction-', 1+count(preceding-sibling::processing-instruction()), '-')"/></axsl:template><axsl:template match="@*" mode="generate-id-from-path"><axsl:apply-templates select="parent::*" mode="generate-id-from-path"/><axsl:value-of select="concat('.@', name())"/></axsl:template><axsl:template match="*" mode="generate-id-from-path" priority="-0.5"><axsl:apply-templates select="parent::*" mode="generate-id-from-path"/><axsl:text>.</axsl:text><axsl:value-of select="concat('.',name(),'-',1+count(preceding-sibling::*[name()=name(current())]),'-')"/></axsl:template>

<axsl:template match="node() | @*" mode="schematron-get-full-path-3"><axsl:for-each select="ancestor-or-self::*"><axsl:text>/</axsl:text><axsl:value-of select="name(.)"/><axsl:if test="parent::*"><axsl:text>[</axsl:text><axsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/><axsl:text>]</axsl:text></axsl:if></axsl:for-each><axsl:if test="not(self::*)"><axsl:text/>/@<axsl:value-of select="name(.)"/></axsl:if></axsl:template>


<axsl:template match="/" mode="generate-id-2">U</axsl:template><axsl:template match="*" mode="generate-id-2" priority="2"><axsl:text>U</axsl:text><axsl:number level="multiple" count="*"/></axsl:template><axsl:template match="node()" mode="generate-id-2"><axsl:text>U.</axsl:text><axsl:number level="multiple" count="*"/><axsl:text>n</axsl:text><axsl:number count="node()"/></axsl:template><axsl:template match="@*" mode="generate-id-2"><axsl:text>U.</axsl:text><axsl:number level="multiple" count="*"/><axsl:text>_</axsl:text><axsl:value-of select="string-length(local-name(.))"/><axsl:text>_</axsl:text><axsl:value-of select="translate(name(),':','.')"/></axsl:template><axsl:template match="text()" priority="-1"/>


<axsl:template match="/"><html xmlns:svrl="http://purl.oclc.org/dsdl/svrl"><head><title>Requirements by WMO Core Metadata Profile v1.3</title><style type="text/css">
  table { border-collapse: collapse; }
  td, th {
    padding-left: 4px; padding-right: 4px;
    border: 1px solid grey; white-space: normal;
  }
  tr.Error { background-color: #FFCCFF; }
  tr.Cond { background-color: #FFCCCC; }
  tr.Warn { background-color: #FFFFCC; }
  tr.Notice { background-color: #FFFFFF; }
  tr.Info { background-color: #EEEEEE;  color: #666666; }
  td.br { word-break: break-all; }
  </style></head><body><h1>Schematron validation result</h1><dl><dt>Title:</dt><dd>Requirements by WMO Core Metadata Profile v1.3</dd><dt>Version:</dt><dd>2014-03-06</dd><xsl:if xmlns:xsl="http://www.w3.org/1999/XSL/Transform" test="//processing-instruction('document-uri')"><dt>Source:</dt><dd><a href="{//processing-instruction('document-uri')}"><xsl:value-of select="//processing-instruction('document-uri')"/></a></dd></xsl:if></dl><p>Levels:<br/><table border="1"><tbody><tr><th>Level</th><th>Description</th></tr><tr class="Error"><td>Error</td><td>Mandatory (<b>shall</b> level): the record will not be compliant until the issue is solved.</td></tr><tr class="Cond"><td>Cond</td><td>Conditional: possible error with a condition that cannot be tested automatically.</td></tr><tr class="Warn"><td>Warn</td><td>Warning (<b>should</b> level): failed to meet guidance, which may be mandatory in the later version of WMO Core Profile.</td></tr><tr class="Notice"><td>Notice</td><td>Notice of a best practice which is optional; record creators <b>may</b> adopt the suggestion.</td></tr><tr class="Info"><td>Info</td><td>Information: message does not necessarily mean good or bad.</td></tr></tbody></table></p><p>Result:<br/><table border="1"><tbody><tr><th>Level</th><th>Source</th><th>Rule id</th><th>Location</th><th>Message</th></tr><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="/" mode="M6"/><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="/" mode="M7"/></tbody></table></p></body></html></axsl:template>


<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron">Requirements by WMO Core Metadata Profile v1.3</svrl:text>




	
<axsl:template match="gmd:*[contains('abcdefghijklmnopqrstuvwxyz',   substring(local-name(),1,1))]" priority="1016" mode="M6">

		
<axsl:choose><axsl:when test="(string-length(*)&gt;0) or @xlink:href or @uuidref or @gco:nilReason"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Info"><td>Info</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19139.A21.nilReason">ISO19139.A21.nilReason</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">This element is empty and has no attribute @xlink:href nor @uuidref; it is possible to use @gco.nilReason to describe why this element is left empty.</td></tr></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M6"/></axsl:template><axsl:variable name="hierarchyLevel" select="substring-before(normalize-space(concat( //gmd:MD_Metadata/gmd:hierarchyLevel/*/@codeListValue, ' ', translate(normalize-space(//gmd:MD_Metadata/gmd:hierarchyLevel/*), ' ', '_'), ' ', 'dataset --dummy--')), ' ')"/>

	
<axsl:template match="gmd:MD_Metadata" priority="1014" mode="M6">

		
<axsl:if test="true()"><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Info"><td>Info</td><td>NONE</td><td class="br">print.fileIdentifier</td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br"><axsl:text xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron"/><axsl:value-of xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="gmd:fileIdentifier"/><axsl:text xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron"/></td></tr></axsl:if>

		
<axsl:if test="not(gmd:language)"><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Cond"><td>Cond</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19139.TA1.language">ISO19139.TA1.language</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">MD_Metadata.language MUST be documented unless defined by the encoding standard.</td></tr></axsl:if>

		
<axsl:if test="not(gmd:characterSet)"><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Cond"><td>Cond</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19139.TA1.mdCharset">ISO19139.TA1.mdCharset</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">MD_Metadata.characterSet MUST be documented if ISO/IEC 10646 not used and not defined by the encoding standard.</td></tr></axsl:if><axsl:apply-templates select="@*|*" mode="M6"/></axsl:template>

	
<axsl:template match="gmd:MD_DataIdentification" priority="1013" mode="M6">

		
<axsl:if test="not(gmd:characterSet)"><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Cond"><td>Cond</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19139.TA1.dsCharset">ISO19139.TA1.dsCharset</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">MD_DataIdentification.characterSet MUST be documented if ISO/IEC 10646 not used.</td></tr></axsl:if>

		
<axsl:choose><axsl:when test="($hierarchyLevel != 'dataset') or (count( gmd:extent/gmd:EX_Extent/gmd:geographicElement/gmd:EX_GeographicBoundingBox) + count( gmd:extent/gmd:EX_Extent/gmd:geographicElement/gmd:EX_GeographicDescription) &gt; 0)"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19139.TA1.geographic">ISO19139.TA1.geographic</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">When hierarchyLevel is dataset, either EX_GeographicBoundingBox or EX_GeographicDescription MUST be documented.</td></tr></axsl:otherwise></axsl:choose>

		
<axsl:choose><axsl:when test="($hierarchyLevel != 'dataset') or gmd:topicCategory"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19139.TA1.topicCategory">ISO19139.TA1.topicCategory</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">topicCategory is mandatory unless hierarchyLevel is dataset</td></tr></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M6"/></axsl:template>

	
<axsl:template match="gmd:MD_AggregateInformation" priority="1012" mode="M6">

		
<axsl:choose><axsl:when test="gmd:aggregateDataSetName or gmd:aggregateDataSetIdentifier"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19139.TA1.aggregateDatasetName">ISO19139.TA1.aggregateDatasetName</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">Either aggregateDataSetName or aggregateDataSetIdentifier must be
documented</td></tr></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M6"/></axsl:template>

	
<axsl:template match="gmd:MD_LegalConstraints" priority="1011" mode="M6">

		
<axsl:choose><axsl:when test="gmd:otherConstraints or not(       gmd:accessConstraints/*/@codeListValue='otherRestrictions' or       gmd:accessConstraints/*/text()='otherRestrictions' or       gmd:useConstraints/*/@codeListValue='otherRestrictions' or       gmd:useConstraints/*/text()='otherRestrictions'     )"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19139.TA1.otherConstraints">ISO19139.TA1.otherConstraints</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">otherConstraints must be documented if accessConstraints or useConstraints = "otherRestrictions"</td></tr></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M6"/></axsl:template>

	
<axsl:template match="gmd:DQ_DataQuality" priority="1010" mode="M6"><axsl:variable name="level" select="substring-before(normalize-space(concat(       gmd:scope/gmd:DQ_Scope/gmd:level/*/@codeListValue, ' ',       translate(normalize-space(gmd:scope/gmd:DQ_Scope/gmd:level/*), ' ', '_'),       ' --dummy--'     )), ' ')"/>

		
<axsl:choose><axsl:when test="($level != 'dataset') or (gmd:report or gmd:lineage)"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19139.TA1.dqReportLineage">ISO19139.TA1.dqReportLineage</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">"report" or "lineage" role is mandatory if scope.DQ_Scope.level = 'dataset'</td></tr></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M6"/></axsl:template>

	
<axsl:template match="gmd:DQ_Scope" priority="1009" mode="M6"><axsl:variable name="level" select="substring-before(normalize-space(concat(       gmd:level/*/@codeListValue, ' ',       translate(normalize-space(gmd:level/*), ' ', '_'),       ' --dummy--'     )), ' ')"/>

		
<axsl:choose><axsl:when test="gmd:levelDescription or ($level = 'dataset' or $level = 'series')"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19139.TA1.levelDescription">ISO19139.TA1.levelDescription</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">"levelDescription" is mandatory if "level" notEqual 'dataset' or 'series'</td></tr></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M6"/></axsl:template>

	
<axsl:template match="gmd:LI_Lineage" priority="1008" mode="M6"><axsl:variable name="level" select="substring-before(normalize-space(concat(       ../../gmd:scope/gmd:DQ_Scope/gmd:level/*/@codeListValue, ' ',       translate(normalize-space(../../gmd:scope/gmd:DQ_Scope/gmd:level/*),       ' ', '_'),       ' --dummy--'     )), ' ')"/>

		
<axsl:choose><axsl:when test="($level != 'dataset' and $level != 'series') or       (gmd:source or gmd:processStep) or gmd:statement"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19139.TA1.lineageStatement">ISO19139.TA1.lineageStatement</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">If(count(source) + count(processStep) =0) and (DQ_DataQuality.scope.level = 'dataset' or 'series') then statement is mandatory</td></tr></axsl:otherwise></axsl:choose>

		
<axsl:choose><axsl:when test="gmd:source or gmd:processStep or gmd:statement"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19139.TA1.lineageContent">ISO19139.TA1.lineageContent</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">At least one of gmd:source, gmd:processStep or gmd:statement must be documented.</td></tr></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M6"/></axsl:template>

	
<axsl:template match="gmd:LI_Source" priority="1007" mode="M6">

		
<axsl:choose><axsl:when test="gmd:description or gmd:sourceExtent"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19139.TA1.LI_Source">ISO19139.TA1.LI_Source</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">Either description or sourceExtent must be documented</td></tr></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M6"/></axsl:template>

	
<axsl:template match="gmd:MD_Georectified" priority="1006" mode="M6">

		
<axsl:choose><axsl:when test="(gmd:checkPointAvailability = '0' or gmd:checkPointAvailability = 'false') or gmd:checkPointDescription"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19139.TA1.MD_Georectified">ISO19139.TA1.MD_Georectified</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">"checkPointDescription" is mandatory if "checkPointAvailability" = 1</td></tr></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M6"/></axsl:template>

	
<axsl:template match="gmd:MD_Band" priority="1005" mode="M6">

		
<axsl:choose><axsl:when test="not(gmd:maxValue or gmd:minValue) or gmd:units"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19139.TA1.bandUnits">ISO19139.TA1.bandUnits</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">"units" is mandatory if "maxValue" or "minValue" are provided</td></tr></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M6"/></axsl:template>

	
<axsl:template match="gmd:MD_Distribution" priority="1004" mode="M6">

		
<axsl:choose><axsl:when test="gmd:distributionFormat or gmd:distributor/*/gmd:distributorFormat"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19139.TA1.distributionFormat">ISO19139.TA1.distributionFormat</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">count (distributionFormat + distributorFormat) &gt; 0</td></tr></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M6"/></axsl:template>

	
<axsl:template match="gmd:MD_ExtendedElementInformation" priority="1003" mode="M6"><axsl:variable name="dataType" select="substring-before(normalize-space(concat(       gmd:dataType/*/@codeListValue, ' ',       translate(normalize-space(gmd:dataType/*), ' ', '_'),       ' --dummy--'     )), ' ')"/><axsl:variable name="obligation" select="substring-before(normalize-space(concat(       gmd:obligation/*/@codeListValue, ' ',       translate(normalize-space(gmd:obligation/*), ' ', '_'),       ' --dummy--'     )), ' ')"/>

		
<axsl:choose><axsl:when test="$dataType = 'codelist' or $dataType = 'enumeration' or       $dataType = 'codelistElement' or (gmd:obligation and       gmd:maximumOccurence and gmd:domainValue)"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19139.TA1.extObligation">ISO19139.TA1.extObligation</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">if "dataType" notEqual 'codelist', 'enumeration' or 'codelistElement' then "obligation", "maximumOccurence" and "domainValue" are mandatory</td></tr></axsl:otherwise></axsl:choose>

		
<axsl:choose><axsl:when test="$obligation != 'conditional' or gmd:condition"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19139.TA1.extCondition">ISO19139.TA1.extCondition</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">if "obligation" = 'conditional' then "condition" is mandatory</td></tr></axsl:otherwise></axsl:choose>

		
<axsl:choose><axsl:when test="$dataType != 'codeListElement' or gmd:domainCode"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19139.TA1.extDomainCode">ISO19139.TA1.extDomainCode</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">if "dataType" = 'codelistElement' then "domainCode" is mandatory</td></tr></axsl:otherwise></axsl:choose>

		
<axsl:choose><axsl:when test="$dataType = 'codelistElement' or gmd:shortName"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19139.TA1.extShortName">ISO19139.TA1.extShortName</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">if "dataType" notEqual 'codelistElement' then "shortName" is mandatory</td></tr></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M6"/></axsl:template>

	
<axsl:template match="gmd:EX_Extent" priority="1002" mode="M6">

		
<axsl:choose><axsl:when test="gmd:description or gmd:geographicElement or gmd:temporalElement or gmd:verticalElement"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19139.TA1.extent">ISO19139.TA1.extent</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">count(description + geographicElement + temporalElement + verticalElement) &gt; 0</td></tr></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M6"/></axsl:template>

	
<axsl:template match="gmd:CI_ResponsibleParty" priority="1001" mode="M6">

		
<axsl:choose><axsl:when test="gmd:individualName or gmd:organisationName or gmd:positionName"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19139.TA1.responsibleParty:">ISO19139.TA1.responsibleParty:</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">count of (individualName + organisationName + positionName) &gt; 0</td></tr></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M6"/></axsl:template>

	
<axsl:template match="gmd:EX_GeographicBoundingBox" priority="1000" mode="M6">

		
<axsl:choose><axsl:when test="(-180.0 &lt;= number(gmd:westBoundLongitude)) and     (number(gmd:westBoundLongitude) &lt;= 180.0)"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19115.B.R344">ISO19115.B.R344</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">-180,0 &lt;= West Bounding Longitude value &lt;= 180,0</td></tr></axsl:otherwise></axsl:choose>

		
<axsl:choose><axsl:when test="(-180.0 &lt;= number(gmd:eastBoundLongitude)) and     (number(gmd:eastBoundLongitude) &lt;= 180.0)"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19115.B.R345">ISO19115.B.R345</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">-180,0 &lt;= East Bounding Longitude value &lt;= 180,0</td></tr></axsl:otherwise></axsl:choose>

		
<axsl:choose><axsl:when test="(-90.0 &lt;= number(gmd:southBoundLatitude)) and     (number(gmd:southBoundLatitude) &lt;= 90.0)"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19115.B.R346">ISO19115.B.R346</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">-90,0 &lt;= South Bounding Latitude value {<axsl:text xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron"/><axsl:value-of xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="number(gmd:southBoundLatitude)"/><axsl:text xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron"/>} &lt;= 90,0</td></tr></axsl:otherwise></axsl:choose>

		
<axsl:choose><axsl:when test="(-90.0 &lt;= number(gmd:northBoundLatitude)) and     (number(gmd:northBoundLatitude) &lt;= 90.0)"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19115.B.R347a">ISO19115.B.R347a</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">-90,0 &lt;= North Bounding Latitude value {<axsl:text xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron"/><axsl:value-of xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="number(gmd:northBoundLatitude)"/><axsl:text xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron"/>} &lt;= 90,0</td></tr></axsl:otherwise></axsl:choose>

		
<axsl:choose><axsl:when test="number(gmd:southBoundLatitude) &lt;= number(gmd:northBoundLatitude)"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>ISO</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/iso19139.sch#ISO19115.B.R347b">ISO19115.B.R347b</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">South Bounding Latitude value {<axsl:text xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron"/><axsl:value-of xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="number(gmd:southBoundLatitude)"/><axsl:text xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron"/>} &lt;= North Bounding Latitude value {<axsl:text xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron"/><axsl:value-of xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="number(gmd:northBoundLatitude)"/><axsl:text xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron"/>}</td></tr></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M6"/></axsl:template><axsl:template match="text()" priority="-1" mode="M6"/><axsl:template match="@*|node()" priority="-2" mode="M6"><axsl:apply-templates select="@*|*" mode="M6"/></axsl:template>




	
<axsl:template match="gmd:MD_Metadata" priority="1008" mode="M7">

		
<axsl:choose><axsl:when test="true()"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>WCMP</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/conf/ISO-TS-19139-2007-xml-schema-validation">WCMP13.ISO-TS-19139-2007-xml-schema-validation</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">6.1.1 Each WIS Discovery Metadata record shall validate without error against the XML schemas defined in ISO/TS 19139:2007.</td></tr></axsl:otherwise></axsl:choose>

		
<axsl:choose><axsl:when test="true()"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>WCMP</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/conf/ISO-TS-19139-2007-rule-based-validation">WCMP13.ISO-TS-19139-2007-rule-based-validation</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">6.1.2 Each WIS Discovery Metadata record shall validate without error against the rule-based constraints listed in ISO/TS 19139:2007 Annex A (Table A.1).</td></tr></axsl:otherwise></axsl:choose>

		
<axsl:choose><axsl:when test="not(.//*[name()=local-name()])"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>WCMP</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/conf/explicit-xml-namespace-identification">WCMP13.explicit-xml-namespace-identification</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">6.2.1 Each WIS Discovery Metadata record shall name explicitly all namespaces used within the record; use of default namespaces is prohibited.</td></tr></axsl:otherwise></axsl:choose>

		
<axsl:choose><axsl:when test="not(.//*[namespace-uri() = 'http://www.opengis.net/gml'])"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>WCMP</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/conf/gml-namespace-specification">WCMP13.gml-namespace-specification</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">6.3.1 Each WIS Discovery Metadata record shall declare the following XML namespace for GML: http://www.opengis.net/gml/3.2.</td></tr></axsl:otherwise></axsl:choose>

		
<axsl:if test="(string(gmd:metadataStandardName/*) != 'WMO Core Metadata Profile of ISO 19115 (WMO Core), 2003/Cor.1:2006 (ISO 19115), 2007 (ISO/TS 19139)') or (string(gmd:metadataStandardVersion/*) != '1.3') "><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Notice"><td>Notice</td><td>WCMP</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/wcmp13.sch#WCMP.metadataStandard">WCMP.metadataStandard</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">a WIS Discovery Metadata record may declare compliance with WCMP by
metadataStandardName = "WMO Core Metadata Profile of ISO 19115 (WMO Core), 2003/Cor.1:2006 (ISO 19115), 2007 (ISO/TS 19139)" (currently "<axsl:text xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron"/><axsl:value-of xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="string(gmd:metadataStandardName/*)"/><axsl:text xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron"/>") and
metadataStandardVersion = "1.3" (currently "<axsl:text xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron"/><axsl:value-of xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="string(gmd:metadataStandardVersion/*)"/><axsl:text xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron"/>").</td></tr></axsl:if>

		
<axsl:choose><axsl:when test="count(gmd:fileIdentifier) = 1"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>WCMP</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/conf/fileIdentifier-cardinality">WCMP13.fileIdentifier-cardinality</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">8.1.1 Each WIS Discovery Metadata record shall include one gmd:MD_Metadata/gmd:fileIdentifier attribute</td></tr></axsl:otherwise></axsl:choose>

		
<axsl:choose><axsl:when test="starts-with(gmd:fileIdentifier/*/text(), 'urn:x-wmo:md:')"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Warn"><td>Warn</td><td>WCMP</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/wcmp13.sch#WCMP.fileIdentifier-style">WCMP.fileIdentifier-style</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">[§8.1 ¶5] WMO Core Metadata Profile recommends the use of a URI structure for gmd:fileIdentifier attributes.</td></tr></axsl:otherwise></axsl:choose>

		
<axsl:choose><axsl:when test="gmd:identificationInfo/*/gmd:descriptiveKeywords[       (*/gmd:thesaurusName/*/gmd:title/* = 'WMO_CategoryCode') or       (*/gmd:thesaurusName/*/gmd:title/*/@xlink:href =         'http://wis.wmo.int/2012/codelists/WMOCodeLists.xml#WMO_CategoryCode')       ]     "/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>WCMP</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/conf/WMO_CategoryCode-keyword-cardinality">WCMP13.WMO_CategoryCode-keyword-cardinality</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">Requirement 8.2.1: Each WIS Discovery Metadata record shall include at least one keyword from the WMO_CategoryCode code list. [such descriptiveKeywords must be present]</td></tr></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M7"/></axsl:template>

	
<axsl:template match="gmd:descriptiveKeywords[     (*/gmd:thesaurusName/*/gmd:title/* = 'WMO_CategoryCode') or     (*/gmd:thesaurusName/*/gmd:title/*/@xlink:href =       'http://wis.wmo.int/2012/codelists/WMOCodeLists.xml#WMO_CategoryCode')   ]" priority="1007" mode="M7"><axsl:variable name="kwlist" select="'!weatherObservations!weatherForecasts!meteorology!hydrology!climatology!landMeteorologyClimate!synopticMeteorology!marineMeteorology!agriculturalMeteorology!aerology!marineAerology!oceanography!landHydrology!rocketSounding!pollution!waterPollution!landWaterPollution!seaPollution!landPollution!airPollution!glaciology!actinometry!satelliteObservation!airplaneObservation!observationPlatform!atmosphericComposition!spaceWeather!'"/>

		
<axsl:choose><axsl:when test="*/gmd:keyword[contains($kwlist,       concat('!',normalize-space(*/text()),'!'))]"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>WCMP</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/conf/WMO_CategoryCode-keyword-cardinality">WCMP13.WMO_CategoryCode-keyword-cardinality</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">Requirement 8.2.1: Each WIS Discovery Metadata record shall include at least one keyword from the WMO_CategoryCode code list. [keyword must be chosen from the list]</td></tr></axsl:otherwise></axsl:choose>

		
<axsl:choose><axsl:when test="*/gmd:type/gmd:MD_KeywordTypeCode = 'theme'"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>WCMP</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/conf/WMO_CategoryCode-keyword-theme">WCMP13.WMO_CategoryCode-keyword-theme</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">Requirement 8.2.2: Keywords from WMO_CategoryCode code list shall be defined as keyword type “theme”.</td></tr></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M7"/></axsl:template>

	
<axsl:template match="gmd:descriptiveKeywords" priority="1006" mode="M7">

		
<axsl:choose><axsl:when test="count(../gmd:descriptiveKeywords/*/gmd:thesaurusName[       */gmd:title/* = current()/*/gmd:thesaurusName/*/gmd:title/*]) &lt;= 1"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>WCMP</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/conf/keyword-grouping">WCMP13.keyword-grouping</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">Requirement 8.2.3: All keywords sourced from a particular keyword thesaurus shall be grouped into a single instance of the MD_Keywords class. [<axsl:text xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron"/><axsl:value-of xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="count(../gmd:descriptiveKeywords/*/gmd:thesaurusName[       */gmd:title/* = current()/*/gmd:thesaurusName/*/gmd:title/*])"/><axsl:text xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron"/> duplicate gmd:descriptiveKeywords instances with the same thesaurus name]</td></tr></axsl:otherwise></axsl:choose>

		
<axsl:if test="not(*/gmd:thesaurusName[*/gmd:title or @gco:nilReason])"><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Notice"><td>Notice</td><td>WCMP</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/wcmp13.sch#WCMP.keyword-grouping-without-thesaurus">WCMP.keyword-grouping-without-thesaurus</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">It is beneficial to identify and document gmd:thesaurus for gmd:desciptiveKeywords.</td></tr></axsl:if><axsl:apply-templates select="@*|*" mode="M7"/></axsl:template>

	
<axsl:template match="gmd:MD_Metadata" priority="1005" mode="M7">

		
<axsl:choose><axsl:when test="(gmd:hierarchyLevel/* = 'nonGeographicDataset') or     (gmd:identificationInfo/*/gmd:extent/*/gmd:geographicElement/      gmd:EX_GeographicBoundingBox)"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>WCMP</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/conf/geographic-bounding-box">WCMP13.geographic-bounding-box</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">Requirement 8.2.4: Each WIS Discovery Metadata record describing geographic
data shall include the description of at least one geographic bounding box defining the spatial extent of the data.</td></tr></axsl:otherwise></axsl:choose>

		
<axsl:choose><axsl:when test="(gmd:language/*/@codeListValue = 'en') or     (gmd:language/*/@codeListValue = 'eng') or      (gmd:locale/*/gmd:languageCode/*/@codeListValue = 'en') or      (gmd:locale/*/gmd:languageCode/*/@codeListValue = 'eng') "/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>WCMP</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/wcmp13.sch#WCMP.atLeastEnglish">WCMP.atLeastEnglish</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">Requirement 8.2.5: All information within a metadata record shall, as a minimum, be provided in English within the metadata record.</td></tr></axsl:otherwise></axsl:choose><axsl:variable name="global_exchange_data" select="starts-with(gmd:fileIdentifier/*/text(),         'urn:x-wmo:md:int.wmo.wis::')"/>

		
<axsl:if test="$global_exchange_data"><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Notice"><td>Notice</td><td>WCMP</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/conf/fileIdentifier-for-globally-exchanged-data">WCMP13.fileIdentifier-for-globally-exchanged-data</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">fileIdentifier (<axsl:text xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron"/><axsl:value-of xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="gmd:fileIdentifier"/><axsl:text xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron"/>) is considered as global distribution.
Requirement 9.2.1: A WIS Discovery Metadata record describing data for global exchange via the WIS shall have a gmd:MD_Metadata/gmd:fileIdentifier attribute formatted as follows (where {uid} is a unique identifier derived from the GTS bulletin or file name): urn:x-wmo:md:int.wmo.wis::{uid}.</td></tr></axsl:if>

		
<axsl:choose><axsl:when test="not($global_exchange_data) or     (gmd:identificationInfo/*/gmd:descriptiveKeywords/*[         ((gmd:thesaurusName/*/gmd:title/* = 'WMO_DistributionScopeCode') or  (gmd:thesairusName/*/gmd:title/*/@xlink:href = 'http://wis.wmo.int/2012/codelists/WMOCodeLists.xml#WMO_DistributionScopeCode')         )         and (gmd:type/* = 'dataCentre')  and (gmd:keyword = 'GlobalExchange')       ]     )"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>WCMP</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/conf/identification-of-globally-exchanged-data">WCMP13.identification-of-globally-exchanged-data</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">Requirement 9.1.1: A WIS Discovery Metadata record describing data for global exchange via the WIS shall indicate the scope of distribution using the keyword “GlobalExchange” of type “dataCenterdataCentre” from thesaurus WMO_DistributionScopeCode.</td></tr></axsl:otherwise></axsl:choose>

		
<axsl:choose><axsl:when test="not($global_exchange_data) or     gmd:identificationInfo/*/gmd:resourceConstraints/*/gmd:otherConstraints/*[       contains('!WMOEssential!WMOAdditional!WMOOther!', concat('!', ., '!'))     ]"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>WCMP</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/conf/WMO-data-policy-for-globally-exchangeddata">WCMP13.WMO-data-policy-for-globally-exchangeddata</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">Requirement 9.3.1: A WIS Discovery Metadata record describing data for global exchange via the WIS shall indicate the WMO Data License as Legal Constraint (type: “otherConstraints”) using one and only one term from the WMO_DataLicenseCode code list.</td></tr></axsl:otherwise></axsl:choose>

		
<axsl:choose><axsl:when test="count(     gmd:identificationInfo/*/gmd:resourceConstraints/*/gmd:otherConstraints/*[       contains('!WMOEssential!WMOAdditional!WMOOther!', concat('!', ., '!'))     ]) &lt;= 1"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>WCMP</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/wcmp13.sch#WCMP.WMO-data-policy-disambiguity">WCMP.WMO-data-policy-disambiguity</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">[§9.3 ¶5] The presence of more than one WMO Data Policy statement in a single metadata record yields an ambiguous state; a WIS Discovery Metadata record describing data for global exchange shall declare only a single WMO Data Policy.</td></tr></axsl:otherwise></axsl:choose>

		
<axsl:choose><axsl:when test="not($global_exchange_data) or     (contains('!GTSPriority1!GTSPriority2!GTSPriority3!GTSPriority4!',      concat('!', gmd:identificationInfo/*/gmd:resourceConstraints/*/      gmd:otherConstraints/*, '!'))     or (gmd:identificationInfo/*/gmd:resourceConstraints/*/      gmd:otherConstraints/*/@xlink:href      = 'http://wis.wmo.int/2012/codelists/WMOCodeLists.xml#WMO_GTSProductCategoryCode'     ))"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>WCMP</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/conf/GTS-priority-for-globally-exchanged-data">WCMP13.GTS-priority-for-globally-exchanged-data</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">Requirement 9.3.2: A WIS Discovery Metadata record describing data for global exchange via the WIS shall indicate the GTS Priority as Legal Constraint (type: “otherConstraints”) using one and only one term from the WMO_GTSProductCategoryCode code list.</td></tr></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M7"/></axsl:template>

	
<axsl:template match="gmd:dateStamp" priority="1004" mode="M7">

		
<axsl:choose><axsl:when test="     starts-with(translate(*, '0123456789', '9999999999'),'9999-99-99') or     starts-with(translate(*, '0123456789', '9999999999'),'9999-99-99T99:99:99')     "/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>WCMP</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/wcmp13.sch#WCMP.dateStamp">WCMP.dateStamp</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">[§8.1 ¶9] WMO Core Metadata Profile mandates dateStamp in format YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS.</td></tr></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M7"/></axsl:template>

	
<axsl:template match="gmd:citationDate" priority="1003" mode="M7">

		
<axsl:choose><axsl:when test="     starts-with(translate(*, '0123456789', '9999999999'),'9999-99-99') or     starts-with(translate(*, '0123456789', '9999999999'),'9999-99-99T99:99:99')     "/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Warn"><td>Warn</td><td>WCMP</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/wcmp13.sch#WCMP.citationDate">WCMP.citationDate</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">[§8.1 ¶11] WMO Core Metadata Profile recommends citation date in format YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS.</td></tr></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M7"/></axsl:template>

	
<axsl:template match="gmd:contact" priority="1002" mode="M7">

		
<axsl:choose><axsl:when test="*/gmd:role/*/@codeListValue = 'pointOfContact'"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Warn"><td>Warn</td><td>WCMP</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/wcmp13.sch#WCMP.mdContRole">WCMP.mdContRole</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">[§8.2 ¶3] WMO Core Metadata Profile recommends gmd:contact should use role = pointOfContact.</td></tr></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M7"/></axsl:template>

	
<axsl:template match="gmd:identificationInfo/*/gmd:pointOfContact" priority="1001" mode="M7">

		
<axsl:choose><axsl:when test="*/gmd:contactInfo/*/gmd:address/*/gmd:electronicMailAddress[     contains(*,'@') or @gco:nilReason or @xlink:href or @uuidref ]"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Warn"><td>Warn</td><td>WCMP</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/wcmp13.sch#WCMP.idPocEmail">WCMP.idPocEmail</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">[§8.2 ¶5] WMO Core Metadata Profile recommends email addres described in gmd:pointOfContact.</td></tr></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M7"/></axsl:template>

	
<axsl:template match="gmd:descriptiveKeywords/*[     (gmd:thesaurusName/*/gmd:title/* = 'WMO_DistributionScopeCode') or     (gmd:thesairusName/*/gmd:title/*/@xlink:href = 'http://wis.wmo.int/2012/codelists/WMOCodeLists.xml#WMO_DistributionScopeCode')   ]" priority="1000" mode="M7">

		
<axsl:choose><axsl:when test="gmd:keyword[       (*/text() = 'GlobalExchange') or       (*/text() = 'RegionalExchange') or       (*/text() = 'OriginatingCentre')     ]"/><axsl:otherwise><tr xmlns:svrl="http://purl.oclc.org/dsdl/svrl" class="Error"><td>Error</td><td>WCMP</td><td class="br"><a href="http://wis.wmo.int/2012/metadata/validationTestSuite/wcmp13.sch#WCMP.scope-distribution">WCMP.scope-distribution</a></td><td><axsl:apply-templates xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" select="." mode="schematron-get-full-path"/></td><td class="br">[§9.1 ¶1] The scope of distribution for data within WIS shall be expressed using the following controlled vocabulary: "GlobalExchange", “RegionalExchange” and “OriginatingCentre” (if the scope of distribution is documented).</td></tr></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M7"/></axsl:template><axsl:template match="text()" priority="-1" mode="M7"/><axsl:template match="@*|node()" priority="-2" mode="M7"><axsl:apply-templates select="@*|*" mode="M7"/></axsl:template></axsl:stylesheet>
