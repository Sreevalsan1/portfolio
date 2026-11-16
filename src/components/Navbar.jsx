export default function Navbar() {
  const links = ['About', 'Skills', 'Projects', 'Contact'];

  return (
    <header className="site-header">
      <nav className="navbar" aria-label="Main navigation">
        <a href="#top" className="brand" aria-label="Home">
          <span className="brand-badge">S</span>
          <span>Sreevalsan</span>
        </a>

        <div className="nav-links">
          {links.map((link) => (
            <a key={link} href={`#${link.toLowerCase()}`}>
              {link}
            </a>
          ))}
        </div>

        <a href="#contact" className="nav-cta">
          Let&apos;s talk
        </a>
      </nav>
    </header>
  );
}
