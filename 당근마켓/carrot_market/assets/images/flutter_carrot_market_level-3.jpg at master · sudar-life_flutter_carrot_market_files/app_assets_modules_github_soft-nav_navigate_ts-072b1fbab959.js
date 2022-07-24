"use strict";(()=>{var le=Object.defineProperty;var t=(O,A)=>le(O,"name",{value:A,configurable:!0});(globalThis.webpackChunk=globalThis.webpackChunk||[]).push([["app_assets_modules_github_soft-nav_navigate_ts"],{41307:(O,A,l)=>{l.d(A,{ZP:()=>N,y0:()=>ae});var h=l(6170),c=l(54293),u=l(61161),d=l(12981),S=l(45922),b=l(36192);const y=20;let o,w=null;function g(s,e,r){return s.dispatchEvent(new CustomEvent(e,{bubbles:!0,cancelable:!0,detail:r}))}t(g,"dispatch");async function N(s){const e={push:!0,replace:!1,type:"GET",dataType:"html",scrollTo:0,...s};e.requestUrl=e.url;const n=B(e.url).hash,a=e.container,L=i(a);o||(o={id:P(),url:window.location.href,title:document.title,container:L,fragment:e.fragment},(0,h.lO)(o,o.title,o.url)),w?.abort();const{signal:M}=w=new AbortController;e.push===!0&&e.replace!==!0&&(ne(o.id,R(a)),(0,h.qA)(null,"",e.requestUrl)),g(a,"pjax:start",{url:e.url}),g(a,"pjax:send");let m;const j=se();try{m=await fetch(e.url,{signal:M,method:e.type,body:e.data,headers:{Accept:"text/html","X-PJAX":"true","X-PJAX-Container":L,"X-Requested-With":"XMLHttpRequest","X-PJAX-VERSION":j.pjax??"","X-PJAX-CSP-VERSION":j.csp??"","X-PJAX-CSS-VERSION":j.css??"","X-PJAX-JS-VERSION":j.js??""}})}catch{m=void 0}if(!m||!m.ok){const F=g(a,"pjax:error");if(e.type==="GET"&&F){const Y=m&&m.headers.get("X-PJAX-URL"),ie=Y?B(Y).href:e.requestUrl;(0,S.b)({pjaxFailureReason:"response_error",requestUrl:e.requestUrl}),q(ie)}g(a,"pjax:complete"),g(a,"pjax:end");return}const I=o,v=re(),U=m.headers.get("X-PJAX-Version"),T=await m.text(),x=X(T,m,e),{contents:z}=x,ee=B(x.url);if(n&&(ee.hash=n,x.url=ee.href),v&&U&&v!==U){g(a,"pjax:hardLoad",{reason:"version_mismatch"}),(0,S.b)({pjaxFailureReason:"version_mismatch",requestUrl:e.requestUrl}),q(x.url);return}if(!z){g(a,"pjax:hardLoad",{reason:"missing_response_body"}),(0,S.b)({pjaxFailureReason:"missing_response_body",requestUrl:e.requestUrl}),q(x.url);return}o={id:e.id!=null?e.id:P(),url:x.url,title:x.title,container:L,fragment:e.fragment},(e.push===!0||e.replace===!0)&&(0,h.lO)(o,x.title,x.url);const Z=document.activeElement,ce=e.container!=null&&e.container.contains(Z);if(Z instanceof HTMLElement&&ce)try{Z.blur()}catch{}x.title&&(document.title=x.title),g(a,"pjax:beforeReplace",{contents:z,state:o,previousState:I}),E(a,z),(0,c.b)(),(0,c.o)();const G=a.querySelector("input[autofocus], textarea[autofocus]");G&&document.activeElement!==G&&G.focus(),x.scripts&&H(x.scripts),x.stylesheets&&te(x.stylesheets);let Q=e.scrollTo;if(n){const F=(0,u.Kt)(document,n);F&&(Q=F.getBoundingClientRect().top+window.pageYOffset)}typeof Q=="number"&&window.scrollTo(window.pageXOffset,Q),g(a,"pjax:success"),g(a,"pjax:complete"),g(a,"pjax:end")}t(N,"pjaxRequest");function q(s){o&&(0,h.lO)(null,"",o.url),window.location.replace(s)}t(q,"locationReplace");let D=!0;const k=window.location.href,_=window.history.state;_&&_.container&&(o=_),"state"in window.history&&(D=!1);function C(s){if((0,b.xc)())return;D||w?.abort();const e=o,r=s.state;let n=null;if(r&&r.container){if(D&&k===r.url)return;if(e){if(e.id===r.id)return;n=e.id<r.id?"forward":"back"}const[a,L,M]=K[r.id]||[],m=document.querySelector(a||r.container);if(m instanceof HTMLElement){e&&oe(n,e.id,R(m)),g(m,"pjax:popstate",{state:r,direction:n,cachedAt:M});const j={id:r.id,url:r.url,container:m,push:!1,fragment:r.fragment||"",scrollTo:!1};L?(g(m,"pjax:start"),o=r,r.title&&(document.title=r.title),g(m,"pjax:beforeReplace",{contents:L,state:r,previousState:e}),E(m,L),(0,c.b)(),(0,c.o)(),g(m,"pjax:end")):N(j),m.offsetHeight}else(0,S.b)({pjaxFailureReason:"no_container",requestUrl:e?.url}),q(location.href)}D=!1}t(C,"onPjaxPopstate");function P(){return new Date().getTime()}t(P,"uniqueId");function R(s){const e=s.cloneNode(!0);return[i(s),Array.from(e.childNodes),Date.now()]}t(R,"cloneContents");function B(s){const e=document.createElement("a");return e.href=s,e}t(B,"parseURL");function i(s){if(s.id)return`#${s.id}`;throw new Error("pjax container has no id")}t(i,"getContainerSelector");function f(s,e,r){let n=[];for(const a of s)a instanceof Element&&(a instanceof r&&a.matches(e)&&n.push(a),n=n.concat(Array.from(a.querySelectorAll(e))));return n}t(f,"findAll");function E(s,e){s.innerHTML="";for(const r of e)r!=null&&s.appendChild(r)}t(E,"replaceWithNodes");function p(s,e){const r=s.headers.get("X-PJAX-URL");return r?B(r).href:e}t(p,"resolveUrl");function X(s,e,r){const n={url:p(e,r.requestUrl),title:""},a=/<html/i.test(s);if((e.headers.get("Content-Type")||"").split(";",1)[0].trim()!=="text/html")return n;let M,m;if(a){const v=s.match(/<head[^>]*>([\s\S.]*)<\/head>/i),U=s.match(/<body[^>]*>([\s\S.]*)<\/body>/i);M=v?Array.from((0,d.r)(document,v[0]).childNodes):[],m=U?Array.from((0,d.r)(document,U[0]).childNodes):[]}else M=m=Array.from((0,d.r)(document,s).childNodes);if(m.length===0)return n;const j=f(M,"title",HTMLTitleElement);n.title=j.length>0&&j[j.length-1].textContent||"";let I;if(r.fragment){if(r.fragment==="body")I=m;else{const v=f(m,r.fragment,Element);I=v.length>0?[v[0]]:[]}if(I.length&&(r.fragment==="body"?n.contents=I:n.contents=I.flatMap(v=>Array.from(v.childNodes)),!n.title)){const v=I[0];v instanceof Element&&(n.title=v.getAttribute("title")||v.getAttribute("data-title")||"")}}else a||(n.contents=m);if(n.contents){n.contents=n.contents.filter(function(T){return T instanceof Element?!T.matches("title"):!0});for(const T of n.contents)if(T instanceof Element)for(const x of T.querySelectorAll("title"))x.remove();const v=f(n.contents,"script[src]",HTMLScriptElement);for(const T of v)T.remove();n.scripts=v,n.contents=n.contents.filter(T=>v.indexOf(T)===-1);const U=f(n.contents,"link[rel=stylesheet]",HTMLLinkElement);for(const T of U)T.remove();n.stylesheets=U,n.contents=n.contents.filter(T=>!U.includes(T))}return n.title&&(n.title=n.title.trim()),n}t(X,"extractContainer");function H(s){const e=document.querySelectorAll("script[src]");for(const r of s){const{src:n}=r;if(Array.from(e).some(m=>m.src===n))continue;const a=document.createElement("script"),L=r.getAttribute("type");L&&(a.type=L);const M=r.getAttribute("integrity");M&&(a.integrity=M,a.crossOrigin="anonymous"),a.src=n,document.head&&document.head.appendChild(a)}}t(H,"executeScriptTags");function te(s){const e=document.querySelectorAll("link[rel=stylesheet]");for(const r of s)Array.from(e).some(n=>n.href===r.href)||document.head&&document.head.appendChild(r)}t(te,"injectStyleTags");const K={},V=[],J=[];function ne(s,e){K[s]=e,J.push(s),$(V,0),$(J,y)}t(ne,"cachePush");function oe(s,e,r){let n,a;K[e]=r,s==="forward"?(n=J,a=V):(n=V,a=J),n.push(e);const L=a.pop();L&&delete K[L],$(n,y)}t(oe,"cachePop");function $(s,e){for(;s.length>e;){const r=s.shift();if(r==null)return;delete K[r]}}t($,"trimCacheStack");function re(){for(const s of document.getElementsByTagName("meta")){const e=s.getAttribute("http-equiv");if(e&&e.toUpperCase()==="X-PJAX-VERSION")return s.content}return null}t(re,"findVersion");function W(s){return document.querySelector(`meta[http-equiv="${s}"]`)?.content??null}t(W,"pjaxMeta");function se(){return{pjax:W("X-PJAX-VERSION"),csp:W("X-PJAX-CSP-VERSION"),css:W("X-PJAX-CSS-VERSION"),js:W("X-PJAX-JS-VERSION")}}t(se,"findAllVersions");function ae(){return o}t(ae,"getState"),window.addEventListener("popstate",C)},54293:(O,A,l)=>{l.d(A,{b:()=>d,o:()=>S});var h=l(7739);const c={},u={};(async()=>(await h.x,c[document.location.pathname]=Array.from(document.querySelectorAll("head [data-pjax-transient]")),u[document.location.pathname]=Array.from(document.querySelectorAll("[data-pjax-replace]"))))(),document.addEventListener("pjax:beforeReplace",function(b){const y=b.detail.contents||[],o=b.target;for(let w=0;w<y.length;w++){const g=y[w];g instanceof Element&&(g.id==="pjax-head"?(c[document.location.pathname]=Array.from(g.children),y[w]=null):g.hasAttribute("data-pjax-replace")&&(u[document.location.pathname]||(u[document.location.pathname]=[]),u[document.location.pathname].push(g),o.querySelector(`#${g.id}`)||(y[w]=null)))}});function d(){const b=u[document.location.pathname];if(!!b)for(const y of b){const o=document.querySelector(`#${y.id}`);o&&o.replaceWith(y)}}t(d,"replaceCachedElements");function S(){const b=c[document.location.pathname];if(!b)return;const y=document.head;for(const o of document.querySelectorAll("head [data-pjax-transient]"))o.remove();for(const o of b)o.matches("title, script, link[rel=stylesheet]")?o.matches("link[rel=stylesheet]")&&y.append(o):(o.setAttribute("data-pjax-transient",""),y.append(o))}t(S,"replaceTransientTags")},36192:(O,A,l)=>{l.d(A,{AU:()=>w,DT:()=>D,F2:()=>y,HN:()=>S,Si:()=>o,T2:()=>R,aN:()=>b,ag:()=>P,po:()=>C,q3:()=>g,uL:()=>B,wz:()=>q,xc:()=>d,xk:()=>k});var h=l(74395),c=l(49815);const u=h.session.adapter,d=t(()=>!(0,c.c)("PJAX_ENABLED"),"isTurboEnabled"),S=t(i=>i?.tagName==="TURBO-FRAME","isTurboFrame"),b=t(()=>{u.progressBar.setValue(0),u.progressBar.show()},"beginProgressBar"),y=t(()=>{u.progressBar.setValue(1),u.progressBar.hide()},"completeProgressBar"),o=t((i,f)=>{const E=new URL(i,window.location.origin),p=new URL(f,window.location.origin);return Boolean(p.hash)&&E.hash!==p.hash&&E.host===p.host&&E.pathname===p.pathname&&E.search===p.search},"isHashNavigation");function w(i,f){const E=i.split("/",3).join("/"),p=f.split("/",3).join("/");return E===p}t(w,"isSameRepo");async function g(){const i=document.head.querySelectorAll("link[rel=stylesheet]"),f=new Set([...document.styleSheets].map(p=>p.href)),E=[];for(const p of i)p.href===""||f.has(p.href)||E.push(N(p));await Promise.all(E)}t(g,"waitForStylesheets");const N=t((i,f=2e3)=>new Promise(E=>{const p=t(()=>{i.removeEventListener("error",p),i.removeEventListener("load",p),E()},"onComplete");i.addEventListener("load",p,{once:!0}),i.addEventListener("error",p,{once:!0}),setTimeout(p,f)}),"waitForLoad"),q=t(i=>{const f=i.querySelectorAll("[data-turbo-replace]"),E=[...document.querySelectorAll("[data-turbo-replace]")];for(const p of f){const X=E.find(H=>H.id===p.id);X&&X.replaceWith(p)}},"replaceElements"),D=t(i=>{for(const f of i.querySelectorAll("link[rel=stylesheet]"))document.head.querySelector(`link[href="${f.getAttribute("href")}"],
           link[data-href="${f.getAttribute("data-href")}"]`)||document.head.append(f)},"addNewStylesheets"),k=t(i=>{for(const f of i.querySelectorAll("script"))document.head.querySelector(`script[src="${f.getAttribute("src")}"]`)||_(f)},"addNewScripts"),_=t(i=>{const{src:f}=i,E=document.createElement("script"),p=i.getAttribute("type");p&&(E.type=p);const X=i.getAttribute("integrity");X&&(E.integrity=X,E.crossOrigin="anonymous"),E.src=f,document.head&&document.head.appendChild(E)},"executeScriptTag"),C=t(i=>{const f=[];for(const E of i.querySelectorAll('meta[data-turbo-track="reload"]'))document.querySelector(`meta[http-equiv="${E.getAttribute("http-equiv")}"]`)?.content!==E.content&&f.push(R(E.getAttribute("http-equiv")));return f},"getChangedTrackedKeys"),P=t(i=>{const f=i.querySelector("[data-turbo-head]")||i.head;return{title:f.querySelector("title")?.textContent,transients:[...f.querySelectorAll("[data-pjax-transient]")],bodyClasses:i.querySelector("meta[name=turbo-body-classes]")?.content}},"getTurboCacheNodes"),R=t(i=>i.replace(/^x-/,"").replaceAll("-","_"),"formatKeyToError"),B=t(i=>document.dispatchEvent(new CustomEvent("turbo:reload",{detail:{reason:i}})),"dispatchTurboReload")},7739:(O,A,l)=>{l.d(A,{C:()=>c,x:()=>h});const h=function(){return document.readyState==="interactive"||document.readyState==="complete"?Promise.resolve():new Promise(u=>{document.addEventListener("DOMContentLoaded",()=>{u()})})}(),c=function(){return document.readyState==="complete"?Promise.resolve():new Promise(u=>{window.addEventListener("load",u)})}()},49815:(O,A,l)=>{l.d(A,{$:()=>b,c:()=>d});var h=l(15205);const c=(0,h.Z)(u);function u(){return(document.head?.querySelector('meta[name="enabled-features"]')?.content||"").split(",")}t(u,"enabledFeatures");const d=(0,h.Z)(S);function S(y){return c().indexOf(y)!==-1}t(S,"isEnabled");const b={isFeatureEnabled:d}},61161:(O,A,l)=>{l.d(A,{$z:()=>u,Kt:()=>h,Q:()=>c});function h(d,S=location.hash){return c(d,u(S))}t(h,"findFragmentTarget");function c(d,S){return S===""?null:d.getElementById(S)||d.getElementsByName(S)[0]}t(c,"findElementByFragmentName");function u(d){try{return decodeURIComponent(d.slice(1))}catch{return""}}t(u,"decodeFragmentValue")},6170:(O,A,l)=>{l.d(A,{Mw:()=>D,_C:()=>q,lO:()=>N,qA:()=>g,y0:()=>d});const h=[];let c=0,u;function d(){return u}t(d,"getState");function S(){try{return Math.min(Math.max(0,history.length)||0,9007199254740991)}catch{return 0}}t(S,"safeGetHistory");function b(){const _={_id:new Date().getTime(),...history.state};return o(_),_}t(b,"initializeState");function y(){return S()-1+c}t(y,"position");function o(_){u=_;const C=location.href;h[y()]={url:C,state:u},h.length=S(),window.dispatchEvent(new CustomEvent("statechange",{bubbles:!1,cancelable:!1}))}t(o,"setState");function w(){return new Date().getTime()}t(w,"uniqueId");function g(_,C,P){c=0;const R={_id:w(),..._};history.pushState(R,C,P),o(R)}t(g,"pushState");function N(_,C,P){const R={...d(),..._};history.replaceState(R,C,P),o(R)}t(N,"replaceState");function q(){const _=h[y()-1];if(_)return _.url}t(q,"getBackURL");function D(){const _=h[y()+1];if(_)return _.url}t(D,"getForwardURL"),u=b(),window.addEventListener("popstate",t(function(C){const P=C.state;if(!(!P||!P._id&&!P.turbo?.restorationIdentifier)){if(P.turbo?.restorationIdentifier){const R=P.turbo.restorationIdentifier;h[y()-1]?.state?.turbo?.restorationIdentifier===R?c--:c++}else P._id<(d()._id||NaN)?c--:c++;o(P)}},"onPopstate"),!0);let k;window.addEventListener("turbo:visit",_=>{_ instanceof CustomEvent&&(k=_.detail.action)}),window.addEventListener("turbo:load",()=>{k!=="restore"&&(c=0,N(history.state,"",""))}),window.addEventListener("hashchange",t(function(){if(S()>h.length){const C={_id:w()};history.replaceState(C,"",location.href),o(C)}},"onHashchange"),!0)},12981:(O,A,l)=>{l.d(A,{r:()=>h});function h(c,u){const d=c.createElement("template");return d.innerHTML=u,c.importNode(d.content,!0)}t(h,"parseHTML")},44983:(O,A,l)=>{l.d(A,{T:()=>d});var h=l(74395),c=l(36192),u=l(41307);function d(S,b,y){(0,c.xc)()?(0,h.visit)(S,{...y}):(0,u.ZP)({...b,url:S})}t(d,"softNavigate")},45922:(O,A,l)=>{l.d(A,{b:()=>u});var h=l(7739);let c=[];function u(o,w=!1){o.timestamp===void 0&&(o.timestamp=new Date().getTime()),o.loggedIn=y(),c.push(o),w?b():S()}t(u,"sendStats");let d=null;async function S(){await h.C,d==null&&(d=window.requestIdleCallback(b))}t(S,"scheduleSendStats");function b(){if(d=null,!c.length)return;const o=document.head?.querySelector('meta[name="browser-stats-url"]')?.content;if(!o)return;const w=JSON.stringify({stats:c});try{navigator.sendBeacon&&navigator.sendBeacon(o,w)}catch{}c=[]}t(b,"flushStats");function y(){return!!document.head?.querySelector('meta[name="user-login"]')?.content}t(y,"isLoggedIn"),document.addEventListener("pagehide",b),document.addEventListener("visibilitychange",b)}}]);})();

//# sourceMappingURL=app_assets_modules_github_soft-nav_navigate_ts-98d188887e67.js.map