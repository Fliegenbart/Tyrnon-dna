function revealAnimatedElements() {
  const animatedElements = document.querySelectorAll("[data-animate]");

  if (!("IntersectionObserver" in window)) {
    animatedElements.forEach((element) => element.classList.add("visible"));
    return;
  }

  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry, index) => {
        if (!entry.isIntersecting) {
          return;
        }

        window.setTimeout(() => {
          entry.target.classList.add("visible");
        }, index * 100);

        observer.unobserve(entry.target);
      });
    },
    { threshold: 0.15, rootMargin: "0px 0px -50px 0px" }
  );

  animatedElements.forEach((element) => observer.observe(element));
}

function updateCircuitDots() {
  const dots = document.querySelectorAll(".circuit-dot");

  if (!dots.length) {
    return;
  }

  const maxScroll = Math.max(
    document.documentElement.scrollHeight - window.innerHeight,
    1
  );
  const scrollProgress = window.scrollY / maxScroll;

  dots.forEach((dot, index) => {
    const threshold = index / dots.length;
    dot.classList.toggle("active", scrollProgress >= threshold);
  });
}

document.addEventListener("DOMContentLoaded", () => {
  revealAnimatedElements();
  updateCircuitDots();
  window.addEventListener("scroll", updateCircuitDots, { passive: true });
});
