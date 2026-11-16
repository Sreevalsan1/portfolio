export default function Hero() {
  return (
    <section className="hero" id="top">
      <div className="container hero-inner">
        <div>
          <span className="kicker">Available for projects</span>
          <h1>
            I build <span className="gradient-text">digital products</span> that feel fast,
            thoughtful, and memorable.
          </h1>
          <p className="lead">
            I&apos;m Sreevalsan K Bhasuran, a developer focused on building clean interfaces,
            delightful interactions, and reliable experiences with React, modern frontend tooling,
            and product thinking.
          </p>

          <div className="hero-actions">
            <a className="primary-btn" href="#projects">
              View projects
            </a>
            <a className="secondary-btn" href="#about">
              About me
            </a>
          </div>

          <div className="hero-meta">
            <div>
              <strong>2+ </strong>
              years learning
            </div>
            <div>
              <strong>10+ </strong>
              projects explored
            </div>
            <div>
              <strong>100% </strong>
              curiosity-driven
            </div>
          </div>
        </div>

        <div className="hero-panel" aria-label="Developer portfolio preview">
          <div className="glow-orb" />
          <div className="code-card">
            <code>{`const portfolio = {
  focus: 'Product UX',
  stack: ['React', 'Vite', 'Node'],
  mode: 'Build + ship'
}`}</code>
          </div>
        </div>
      </div>
    </section>
  );
}
