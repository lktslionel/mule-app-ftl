<flow name="main-flow" doc:name="main-flow">
 <http:inbound-endpoint host="0.0.0.0" exchange-pattern="request-response" doc:name="HTTP" path="esb-example/1.0/soap" port="9211" />
 <cxf:jaxws-service serviceClass="org.example.IPurchaseOrder" doc:name="WS Interface" />

 <logger level="INFO" message=" flowVars : #[flowVars]" />
 <set-variable variableName="operation" value="#[flowVars.cxf_operation.localPart]" doc:name="Request Setting" />
 <logger level="INFO" message=" operation : #[operation]" />
 <flow-ref name="#[operation]-flow" />
 <logger level="INFO" message=" payload : #[payload]" />
 </flow>