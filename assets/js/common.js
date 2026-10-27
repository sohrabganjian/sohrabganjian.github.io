$(document).ready(function () {
  // add toggle functionality to abstract, award and bibtex buttons
  $("a.abstract").click(function () {
    $(this).parent().parent().find(".abstract.hidden").toggleClass("open");
    $(this).parent().parent().find(".award.hidden.open").toggleClass("open");
    $(this).parent().parent().find(".bibtex.hidden.open").toggleClass("open");
  });
  $("a.award").click(function () {
    $(this).parent().parent().find(".abstract.hidden.open").toggleClass("open");
    $(this).parent().parent().find(".award.hidden").toggleClass("open");
    $(this).parent().parent().find(".bibtex.hidden.open").toggleClass("open");
  });
  $("a.bibtex").click(function () {
    $(this).parent().parent().find(".abstract.hidden.open").toggleClass("open");
    $(this).parent().parent().find(".award.hidden.open").toggleClass("open");
    $(this).parent().parent().find(".bibtex.hidden").toggleClass("open");
  });
  $("a").removeClass("waves-effect waves-light");

  // bootstrap-toc
  if ($("#toc-sidebar").length) {
    // remove related publications years from the TOC
    $(".publications h2").each(function () {
      $(this).attr("data-toc-skip", "");
    });
    var navSelector = "#toc-sidebar";
    var $myNav = $(navSelector);
    Toc.init($myNav);
    if (document.querySelector(".cv")) {
      // Use the same fixed-header clearance for anchor navigation and highlighting.
      const links = Array.from($myNav[0].querySelectorAll('a[href^="#"]'));
      const sections = links.map(link => ({
        link,
        heading: document.getElementById(decodeURIComponent(link.hash.slice(1))),
      })).filter(section => section.heading);
      sections.forEach(section => { section.heading.style.scrollMarginTop = "100px"; });
      let scheduled = false;
      function updateCvSection() {
        scheduled = false;
        if (!sections.length) return;
        let current = sections[0];
        sections.forEach(section => {
          if (section.heading.getBoundingClientRect().top <= 120) current = section;
        });
        sections.forEach(section => {
          const active = section === current;
          section.link.classList.toggle("active", active);
          if (active) section.link.setAttribute("aria-current", "location");
          else section.link.removeAttribute("aria-current");
        });
      }
      function scheduleCvSection() {
        if (!scheduled) { scheduled = true; requestAnimationFrame(updateCvSection); }
      }
      window.addEventListener("scroll", scheduleCvSection, { passive: true });
      window.addEventListener("resize", scheduleCvSection);
      window.addEventListener("hashchange", scheduleCvSection);
      window.addEventListener("load", scheduleCvSection);
      document.addEventListener("load", scheduleCvSection, true);
      updateCvSection();
    } else {
      $("body").scrollspy({ target: navSelector });
    }
  }

  // add css to jupyter notebooks (href must be site-root absolute; ../css is wrong inside iframes under /blog/.../ )
  const jupyterCssHref =
    window.alFolioJupyterCssUrl || "/assets/css/jupyter.css";

  let jupyterTheme = determineComputedTheme();

  $(".jupyter-notebook-iframe-container iframe").each(function () {
    const cssLink = document.createElement("link");
    cssLink.href = jupyterCssHref;
    cssLink.rel = "stylesheet";
    cssLink.type = "text/css";
    $(this).contents().find("head").append(cssLink);

    if (jupyterTheme == "dark") {
      $(this).bind("load", function () {
        $(this).contents().find("body").attr({
          "data-jp-theme-light": "false",
          "data-jp-theme-name": "JupyterLab Dark",
        });
      });
    }
  });

  // trigger popovers
  $('[data-toggle="popover"]').popover({
    trigger: "hover",
  });
});
