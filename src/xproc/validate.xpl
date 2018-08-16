<p:declare-step version="1.0"
                xmlns:oai="http://www.openarchives.org/OAI/2.0/"
                xmlns:p="http://www.w3.org/ns/xproc">

  <p:documentation>Validate OAI Static Repository</p:documentation>

  <p:input  port="source" primary="true"/>

  <p:validate-with-xml-schema assert-valid="true" use-location-hints="true">
    <p:input port="schema">
      <p:document href="../schema/oai-pmh/static-repository.xsd"/>
    </p:input>
  </p:validate-with-xml-schema>

  <p:validate-with-schematron assert-valid="true">
    <p:input port="parameters">
      <p:empty/>
    </p:input>
    <p:input port="schema">
      <p:document href="../schema/static-repository.sch"/>
    </p:input>
  </p:validate-with-schematron>

  <p:sink/>

</p:declare-step>
