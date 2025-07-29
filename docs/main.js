window.addEventListener('scroll', () => {
  const glow = document.body.style;
  const scrollFactor = window.scrollY / 500;
  glow.backgroundColor = `rgba(0,255,255,${Math.min(scrollFactor, 0.5)})`;
});

