<!-- -*- mode: xml; -*- -->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <title>Static Repository Conformance Rules</title>
  <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
  <ns prefix="oai" uri="http://www.openarchives.org/OAI/2.0/"/>
  <ns prefix="oai-static" uri="http://www.openarchives.org/OAI/2.0/static-repository"/>
  <pattern>
    <rule context="oai-static:ListRecords">
      <assert test="empty(oai:record/oai:header/oai:setSpec)" id="oai.3.2.6">
	The Static Repository must not use sets. There must not be any setSpec elements in the headers of records.
      </assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="oai-static:ListRecords">
      <assert test="empty(oai:record/oai:header/@status)" id="oai.3.2.7">
	The Static Repository must not include headers for deleted records. There must not be any status attributes on
	the header elements of records.
      </assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="oai-static:Identify">
      <assert test="empty(oai:compression)" id="oai.3.2.8">
	The Static Repository must not claim to support response compression. There must not be any compression elements
	in the Identify part of the Static Repository.
      </assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="oai-static:Identify">
      <assert test="normalize-space(oai:granularity) = 'YYYY-MM-DD'" id="oai.3.2.9a">
	The Static Repository must express all datestamps using YYYY-MM-DD granularity. This must be specified as the
	harvesting granularity in the granularity element.
      </assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="oai:earliestDatestamp | oai:datestamp">
      <assert test="(string-length(normalize-space()) eq 10) and . castable as xs:date" id="oai.3.2.9b">
	The Static Repository must express all datestamps using YYYY-MM-DD granularity.
      </assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="oai-static:ListRecords">
      <assert test="empty(oai:resumptionToken)" id="oai.3.2.10">
	The Static Repository must be a single XML file, it must not include any resumptionToken elements.
      </assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="oai-static:ListRecords">
      <assert test="some $m in ../oai-static:ListMetadataFormats/oai:metadataFormat satisfies $m/oai:metadataPrefix = @metadataPrefix" id="oai.x.1"/>
    </rule>
  </pattern>
</schema>
