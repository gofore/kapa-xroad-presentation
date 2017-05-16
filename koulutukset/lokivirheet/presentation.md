layout: true
name: sininen-palkki
class: sininen-palkki
![logo](../suomifi_logo.svg)

---
layout: true
name: valkoinen
class: valkoinen
![logo](../suomifi_logo.svg)

---
layout: true
name: header
class: center, middle, sininen
![logo](../suomifi_logo.svg)

<!--DON'T TOUCH ABOVE THIS !!!!!! -->
---

template: header
# Lokivirheet

---

template: sininen-palkki

# Lokivirheitä

- configuration_client.log
- proxy.log
- signer.log
- [operointiohjeet](https://confluence.csc.fi/display/KAPAJULKHAL/Security+Server+Log+Monitoring) listaavat muutamia valvottavia virhetilanteita  

---

template: sininen-palkki

# configuration_client.log

```log
11:01:00 [QuartzScheduler_Worker-2] ERROR e.r.x.c.c.g.ConfigurationClient - Failed to download configuration from any configuration location:
        location: http://gdev-cs.i.palveluvayla.com/internalconf; error: HttpError: Network is unreachable
        location: http://gdev-cs2.i.palveluvayla.com/internalconf; error: HttpError: Network is unreachable
```
- Globaalin konfiguraation haku epäonnistui
- Kertoo osoitteet, mistä hakua yritettiin
- Verkko & palomuurit?
- Liityntäpalvelin on kuitenkin käyttökelpoinen keskuskonfiguraation voimassaolon ajan (esim. 72 tuntia)

---

template: sininen-palkki

# Proxy.log virheet

- Erilaisia virhekoodeja on yli 100: [ErrorCodes.java](https://github.com/vrk-kpa/X-Road/blob/develop/src/common-util/src/main/java/ee/ria/xroad/common/ErrorCodes.java)
- Lokeihin tulostuvissa – ja vastausviestissä näkyvissä – virheissä voi näkyä virhekooditus, esimerkiksi Server.ClientProxy.NetworkError

```log
   07:39:04 [qtp2129844134-403] ERROR e.r.x.p.c.FastestConnectionSelectingSSLSocketFactory - Could not connect to any target host ([https://xroad-lxd-ss1.lxd:5500/])
   07:39:04 [qtp2129844134-403] ERROR e.r.x.p.c.AbstractClientProxyHandler - Request processing error (38c8401f-577f-4c1a-9c5b-68ec45a74ea3)
      ee.ria.xroad.common.CodedException: Server.ClientProxy.NetworkError: Could not connect to any target host ([https://xroad-lxd-ss1.lxd:5500/])
	     at ee.ria.xroad.proxy.clientproxy.FastestConnectionSelectingSSLSocketFactory.couldNotConnectException(FastestConnectionSelectingSSLSocketFactory.java:316) ~[proxy-1.0.jar:na]
```

---

template: sininen-palkki

# Server.ClientProxy.NetworkError

* **Server.ClientProxy** = Component
   * Client
   * Server.ClientProxy
   * Server.ServerProxy
   * Signer
* **NetworkError** = Error Code

---

template: sininen-palkki

# proxy.log esimerkkejä

```log
   2017-04-07 13:26:14,021 [qtp2129844134-1793] ERROR e.r.x.p.c.AbstractClientProxyHandler - Request processing error
   ee.ria.xroad.common.CodedException$Fault: Server.ServerProxy.CannotCreateSignature.Signer.TokenNotActive: Token 'softToken' not active
	at ee.ria.xroad.common.CodedException.fromFault(CodedException.java:138) ~[proxy-1.0.jar:na]
	at ee.ria.xroad.common.message.SoapFault.toCodedException(SoapFault.java:127) ~[proxy-1.0.jar:na]
	at
```
--

* Producer-liityntäpalvelimen PIN ei ollut syötetty  

---

template: sininen-palkki

# proxy.log esimerkkejä

```log
   2017-04-07 13:28:11,038 [qtp2129844134-1793] ERROR e.r.x.p.c.AbstractClientProxyHandler - Request processing error (13370c71-2896-4731-97c2-f1258197977f)
   ee.ria.xroad.common.CodedException: Server.ClientProxy.CannotCreateSignature.Signer.TokenNotActive: Token 'softToken' not active
	at ee.ria.xroad.common.CodedException.tr(CodedException.java:173) ~[proxy-1.0.jar:na]
	at ee.ria.xroad.signer.util.ExceptionHelper.tokenNotActive(ExceptionHelper.java:59) ~[na:na]
```
--
* Consumer-liityntäpalvelimen PIN ei ollut syötetty

---

template: sininen-palkki

# proxy.log esimerkkejä

```log
   2017-04-07 13:30:02,602 [qtp2129844134-1817] ERROR e.r.x.p.c.AbstractClientProxyHandler - Request processing error
   ee.ria.xroad.common.CodedException$Fault: Server.ServerProxy.UnknownService: Unknown service: SERVICE:LXDJ/COM/500/SS1/NonExistent/v1
	at ee.ria.xroad.common.CodedException.fromFault(CodedException.java:138) ~[proxy-1.0.jar:na]
	at ee.ria.xroad.common.message.SoapFault.toCodedException(SoapFault.java:127) ~[proxy-1.0.jar:na]
	at
```
--
* Palvelua ei ole olemassa
   - → tällaisia virheitä ei kannata automaattivalvoa...  

---

template: sininen-palkki

# proxy.log

```log
   2016-04-20 11:46:32,430 [Proxy-akka.actor.default-dispatcher-81] ERROR e.r.x.p.messagelog.TimestamperWorker - Timestamper failed for message records [<record id>, ...]: Failed to get time stamp from any time-stamping providers
```
--
* Tämä ja muutamat muut “timestamper failed” virheet voivat johtua siitä, että yhteyttä aikaleimapalveluun ei saatu
* Verkko & palomuurit?
* Viestinvälitys lakkaa 30 minuutin kuluessa

---

template: sininen-palkki

# signer.log

```log
19:14:20 INFO  [Signer-akka.actor.default-dispatcher-2403] e.r.x.c.c.g.ConfigurationDirectoryV2 -
 /etc/xroad/globalconf/FI/private-params.xml expired on 2017-03-23T17:51:01.000+02:00
19:14:20 WARN  [Signer-akka.actor.default-dispatcher-2403] e.r.x.c.c.globalconf.GlobalConfImpl -
Global configuration is invalid: {}
ee.ria.xroad.common.CodedException: OutdatedGlobalConf: /etc/xroad/globalconf/FI/private-params.xml is too old
        at ee.ria.xroad.common.conf.globalconf.ConfigurationDirectoryV2.verifyUpToDate(ConfigurationDirectoryV2.
java:304) ~[signer-1.0.jar:na]
        at ee.ria.xroad.common.conf.globalconf.ConfigurationDirectoryV2$Walker.visitFile(ConfigurationDirectoryV
2.java:225) ~[signer-1.0.jar:na]
        at ee.ria.xroad.common.conf.globalconf.ConfigurationDirectoryV2$Walker.visitFile(ConfigurationDirectoryV
2.java:215) ~[signer-1.0.jar:na]
        at java.nio.file.Files.walkFileTree(Files.java:2670) ~[na:1.8.0_121]
        at java.nio.file.Files.walkFileTree(Files.java:2742) ~[na:1.8.0_121]
        at ee.ria.xroad.common.conf.globalconf.ConfigurationDirectoryV2.eachFile(ConfigurationDirectoryV2.java:2
12) ~[signer-1.0.jar:na]
        at ee.ria.xroad.common.conf.globalconf.ConfigurationDirectoryV2.verifyUpToDate(ConfigurationDirectoryV2.
java:314) ~[signer-1.0.jar:na]
        at ee.ria.xroad.common.conf.globalconf.CachingConfigurationDirectory.verifyUpToDate(CachingConfiguration
Directory.java:122) ~[signer-1.0.jar:na]
```
---

template: sininen-palkki

# signer.log

* OutdatedGlobalConf: /etc/xroad/globalconf/FI/private-params.xml is too old
* Keskuskonfiguraatio on liian vanha
* Konfiguraation haku ei toimi
* Onko yhteys keskuspalvelimeen OK? → configuration_client.log

---

template: sininen-palkki

# signer.log

```log
2016-04-20 11:12:31,968 ERROR [Signer-akka.actor.default-dispatcher-2] e.r.x.s.certmanager.OcspClientWorker - Error when querying certificate '<certificate serial number>'
org.bouncycastle.cert.ocsp.OCSPException: Unable to get valid OCSP response from any responders
```
--
* Tämä ja muutamat muut virheet “OCSP” avainsanalla voivat johtua siitä, että yhteyttä OCSP-responderiin ei saatu
* Verkko & palomuurit?

---

template: header

# Varmenneongelma eri lokeissa

---

template: sininen-palkki

# Allekirjoitusvarmenne ei kunnossa 1/3

* Producer-liityntäpalvelimella allekirjoitusvarmenneongelma.

```log
2017-04-07 13:47:16,891 [qtp2129844134-1885] ERROR e.r.x.p.c.AbstractClientProxyHandler - Request processing error
ee.ria.xroad.common.CodedException$Fault: Server.ServerProxy.ServiceFailed.CannotCreateSignature: Failed to get signing info for member 'SUBSYSTEM:LXDJ/COM/500/SS1': Signer.UnknownMember: Could not find any certificates for member 'SUBSYSTEM:LXDJ/COM/500/SS1'
	at ee.ria.xroad.common.CodedException.fromFault(CodedException.java:138) ~[proxy-1.0.jar:na]
	at ee.ria.xroad.common.message.SoapFault.toCodedException(SoapFault.java:127) ~[proxy-1.0.jar:na]

```
--
* Consumer / proxy.log

---

template: sininen-palkki

# Allekirjoitusvarmenne ei kunnossa 2/3

* Producer-liityntäpalvelimen allekirjoitusvarmenneongelma.

```log
2017-04-07 13:47:16,889 [qtp1369468094-1375] ERROR e.r.x.p.s.ServerProxyHandler - Request processing error (a3e009b2-ea7a-4678-809f-aaa2292477ea)
ee.ria.xroad.common.CodedException: Server.ServerProxy.ServiceFailed.CannotCreateSignature: Failed to get signing info for member 'SUBSYSTEM:LXDJ/COM/500/SS1': Signer.UnknownMember: Could not find any certificates for member 'SUBSYSTEM:LXDJ/COM/500/SS1'
	at ee.ria.xroad.proxy.conf.CachingKeyConfImpl.getSigningCtx(CachingKeyConfImpl.java:84) ~[proxy-1.0.jar:na]
	at ee.ria.xroad.proxy.conf.KeyConf.getSigningCtx(KeyConf.java:122) ~[proxy-1.0.jar:na]
```
--
* Producer / proxy.log

---

template: sininen-palkki

# Allekirjoitusvarmenne ei kunnossa 3/3

* Producer-liityntäpalvelimen allekirjoitusvarmenneongelma.

```log
2017-04-07 13:47:16,872 ERROR [Signer-akka.actor.default-dispatcher-3] e.r.x.s.p.AbstractRequestHandler - Error in request handler
ee.ria.xroad.common.CodedException: UnknownMember: Could not find any certificates for member 'SUBSYSTEM:LXDJ/COM/500/SS1'
	at ee.ria.xroad.common.CodedException.tr(CodedException.java:173) ~[signer-1.0.jar:na]
	at ee.ria.xroad.signer.protocol.handler.GetMemberSigningInfoRequestHandler.handle(GetMemberSigningInfoRequestHandler.java:68) ~[signer-1.0.jar:na]
```
--
* Producer / signer.log

---
template: header
# Kysymyksiä?
