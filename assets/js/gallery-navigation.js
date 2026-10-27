// Track the current gallery section using live positions, including lazy-loaded images.
(() => {
  let pending = false;
  function update() {
    pending = false;
    const links = Array.from(document.querySelectorAll('#toc-sidebar a[href^="#"]'));
    const sections = links.map(link => ({ link, heading: document.getElementById(decodeURIComponent(link.hash.slice(1))) }))
      .filter(item => item.heading);
    if (!sections.length) return;
    let current = sections[0];
    for (const section of sections) {
      if (section.heading.getBoundingClientRect().top <= 120) current = section;
    }
    for (const section of sections) {
      const active = section === current;
      section.link.classList.toggle('active', active);
      if (active) section.link.setAttribute('aria-current', 'location');
      else section.link.removeAttribute('aria-current');
    }
  }
  function schedule() {
    if (!pending) { pending = true; requestAnimationFrame(update); }
  }
  window.addEventListener('scroll', schedule, { passive: true });
  window.addEventListener('resize', schedule);
  window.addEventListener('load', schedule);
  document.addEventListener('load', schedule, true);
})();
