function loadXML(url) {
  return fetch(url)
    .then(res => res.text())
    .then(str => (new window.DOMParser()).parseFromString(str, "text/xml"));
}

async function renderMath(xmlPath = 'math.xml', xslPath = 'style.xsl') {
  const xml = await loadXML(xmlPath);
  const xsl = await loadXML(xslPath);

  let resultDoc;

  if (window.XSLTProcessor) {
    const xsltProc = new XSLTProcessor();
    xsltProc.importStylesheet(xsl);
    resultDoc = xsltProc.transformToFragment(xml, document);
  } else {
    resultDoc = xml.transformNode(xsl);
  }

  const container = document.getElementById('container');
  container.innerHTML = '';
  container.appendChild(resultDoc);
}

window.addEventListener('DOMContentLoaded', () => renderMath());