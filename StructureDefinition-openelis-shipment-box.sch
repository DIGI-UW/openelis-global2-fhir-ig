<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile SupplyDelivery
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:SupplyDelivery</sch:title>
    <sch:rule context="f:SupplyDelivery">
      <sch:assert test="count(f:extension[@url = 'https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-destination-org']) &lt;= 1">extension with URL = 'https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-destination-org': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-source-org']) &lt;= 1">extension with URL = 'https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-source-org': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-temperature']) &lt;= 1">extension with URL = 'https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-temperature': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-capacity']) &lt;= 1">extension with URL = 'https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-capacity': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-notes']) &lt;= 1">extension with URL = 'https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-notes': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/eqa-cycle']) &lt;= 1">extension with URL = 'https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/eqa-cycle': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:status) &gt;= 1">status: minimum cardinality of 'status' is 1</sch:assert>
      <sch:assert test="count(f:suppliedItem) &gt;= 1">suppliedItem: minimum cardinality of 'suppliedItem' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:SupplyDelivery/f:identifier</sch:title>
    <sch:rule context="f:SupplyDelivery/f:identifier">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:use) &lt;= 1">use: maximum cardinality of 'use' is 1</sch:assert>
      <sch:assert test="count(f:type) &lt;= 1">type: maximum cardinality of 'type' is 1</sch:assert>
      <sch:assert test="count(f:system) &gt;= 1">system: minimum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:value) &gt;= 1">value: minimum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:period) &lt;= 1">period: maximum cardinality of 'period' is 1</sch:assert>
      <sch:assert test="count(f:assigner) &lt;= 1">assigner: maximum cardinality of 'assigner' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:SupplyDelivery/f:suppliedItem</sch:title>
    <sch:rule context="f:SupplyDelivery/f:suppliedItem">
      <sch:assert test="count(f:quantity) &gt;= 1">quantity: minimum cardinality of 'quantity' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:SupplyDelivery/f:suppliedItem/f:quantity</sch:title>
    <sch:rule context="f:SupplyDelivery/f:suppliedItem/f:quantity">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:comparator) &lt;= 0">comparator: maximum cardinality of 'comparator' is 0</sch:assert>
      <sch:assert test="count(f:unit) &lt;= 1">unit: maximum cardinality of 'unit' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
