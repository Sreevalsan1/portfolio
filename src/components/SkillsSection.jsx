import { skillGroups } from '../data/projects';

export default function SkillsSection() {
  return (
    <section className="section" id="skills">
      <div className="container">
        <div className="section-heading">
          <span>Skills</span>
          <h2>Tools and systems I use to build and ship.</h2>
        </div>

        <div className="skill-grid">
          {skillGroups.map((group) => (
            <article key={group.title} className="skill-card">
              <h3>{group.title}</h3>
              <div className="skill-tags">
                {group.items.map((item) => (
                  <span key={item}>{item}</span>
                ))}
              </div>
            </article>
          ))}
        </div>
      </div>
    </section>
  );
}
