$(document).ready(function () {
  /**
   * Notebook HTML is shown inside an <iframe>. Links without target="_blank"
   * navigate *the iframe* to the URL. Many sites (arXiv, journals, etc.) forbid
   * embedding via X-Frame-Options / CSP, so the iframe goes blank/gray with no
   * in-frame "back". Opening externals in a new tab avoids that.
   *
   * Patches must run after the iframe loads — document.ready is often too early
   * (previous code ran before body/links existed, so many <a> stayed default).
   */
  function patchNotebookLinks(doc) {
    if (!doc || !doc.body) {
      return;
    }
    $(doc.body)
      .find("a[href]")
      .each(function () {
        const href = ($(this).attr("href") || "").trim();
        if (!href || href.startsWith("#") || href.toLowerCase().startsWith("javascript:")) {
          return;
        }
        $(this).attr({
          target: "_blank",
          rel: "noopener noreferrer",
        });
      });
  }

  $(".jupyter-notebook-iframe-container").each(function () {
    const iframe = $(this).find("iframe").get(0);
    if (!iframe) {
      return;
    }

    const run = function () {
      try {
        const doc = iframe.contentDocument || iframe.contentWindow.document;
        patchNotebookLinks(doc);
      } catch (e) {
        /* cross-origin iframe — cannot patch */
      }
    };

    // Iframe may already be loaded (bfcache / fast load)
    if (iframe.contentDocument && iframe.contentDocument.readyState === "complete") {
      run();
    } else {
      $(iframe).on("load", run);
    }
  });
});
