---
title: "Complex AI Agents"
author: Camron
info: One dev's super-cool-multi-agent architecture is another dev's tech debt
theme: default
lineNumbers: true
mdc: true
---

<style>
.slidev-layout {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.gradient-text {
  background: linear-gradient(135deg, #ffd89b 0%, #ff9a9e 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  font-weight: bold;
}

.card-hover {
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  backdrop-filter: blur(10px);
  background: rgba(255, 255, 255, 0.1);
  border: 1px solid rgba(255, 255, 255, 0.2);
}

.card-hover:hover {
  transform: translateY(-5px);
  box-shadow: 0 20px 40px rgba(0,0,0,0.3);
}

.pulse {
  animation: pulse 2s infinite;
}

@keyframes pulse {
  0% { transform: scale(1); }
  50% { transform: scale(1.05); }
  100% { transform: scale(1); }
}

.fade-in {
  animation: fadeIn 1s ease-in;
}

@keyframes fadeIn {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}

.tech-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
  gap: 1rem;
  padding: 2rem;
}
</style>

---
layout: center
class: text-white
---

<div class="text-center">

# Complex AI Agents

<br/>

### One dev's super-cool-multi-agent architecture is another dev's tech debt

<br/>
<br/>

<div class="flex justify-center gap-8 text-4xl">
  <span>🤖</span>
  <span>🔀</span>
  <span>💻</span>
</div>

</div>

---
layout: two-cols
class: text-white
---

## The Hype is Real 🚀

<v-clicks>

- **Multi-agent frameworks** everywhere
  - Swarms, supervisors, crews
  - Committees, orchestrators
- **Beautiful vision**: Corporate hierarchy of AI
- **Real benefits**: Benchmarks show improvement

</v-clicks>

::right::

<div class="mt-12">

```mermaid {scale:0.5}
graph TD
  A[User Request] --> B[Supervisor]
  B --> C[Planning]
  B --> D[Execution]
  B --> E[Summary]
  C --> F[Subtask 1]
  C --> G[Subtask 2]
  D --> H[Results]
  E --> I[Output]

  style A fill:#667eea
  style B fill:#764ba2
  style I fill:#ff9a9e
```

</div>

---
layout: center
class: text-white text-center
---

<h1 class="text-6xl font-bold mb-8">
  <span class="gradient-text">But here's the thing...</span>
</h1>

<div v-click class="text-3xl opacity-90 pulse">
  These frameworks are a <span class="text-yellow-300 font-bold">temporary fix</span>
</div>

<div v-click class="text-xl mt-8 opacity-80">
  A clever workaround for today's limitations
</div>

---
layout: default
class: text-white
---

## The Brittle Reality 💔

<div class="grid grid-cols-2 gap-8 mt-8">
  <div v-click class="card-hover p-6 rounded-xl">
    <h3 class="text-2xl mb-4 gradient-text">Every Agent = Failure Point</h3>
    <ul class="space-y-2">
      <li>• Errors compound exponentially</li>
      <li>• Debugging nightmare</li>
      <li>• High latency</li>
    </ul>
  </div>

  <div v-click class="card-hover p-6 rounded-xl">
    <h3 class="text-2xl mb-4 gradient-text">Production Reality</h3>
    <ul class="space-y-2">
      <li>• Few swarms in production</li>
      <li>• Fragile & tough to maintain</li>
      <li>• More nodes = more problems</li>
    </ul>
  </div>
</div>

<div v-click class="mt-8 text-center text-2xl opacity-90">
  <carbon-warning class="text-yellow-400 text-3xl inline-block mr-2"/>
  Where are all the successful swarms?
</div>

---
layout: default
class: text-white
---

## Software Dev Example 👨‍💻

<div class="text-lg">

Today's typical agent workflow:

<v-clicks>

1. **Search/Re-ranking Agent** - Scours repos for relevant files
2. **Planning Agent** - Creates approach & breaks into tasks
3. **Coding Agent(s)** - Writes the actual code
4. **Testing Agent** - Writes and runs tests
5. **PR Agent** - Submits pull request

</v-clicks>

</div>

---
layout: default
class: text-white
---

## Why These Steps Exist 🤔

<div class="space-y-3 mt-4">

<v-clicks every="1">

<div class="card-hover p-3 rounded-xl">
  <h3 class="text-base gradient-text">Search & Re-ranking</h3>
  <p class="text-sm">Context windows too small & expensive</p>
  <p class="text-green-400 text-sm">→ Context + price improvements = Obsolete</p>
</div>

<div class="card-hover p-3 rounded-xl">
  <h3 class="text-base gradient-text">Planning & Task Breakdown</h3>
  <p class="text-sm">Smart models direct cheaper models</p>
  <p class="text-green-400 text-sm">→ Internal planning + output limits = Obsolete</p>
</div>

<div class="card-hover p-3 rounded-xl">
  <h3 class="text-base gradient-text">Separate Testing & PRs</h3>
  <p class="text-sm">Output token limits force separation</p>
  <p class="text-green-400 text-sm">→ Feasible today, just expensive!</p>
</div>

</v-clicks>

</div>

---
layout: center
class: text-white
---

<h1 class="text-5xl font-bold text-center mb-8">
  Imagine a <span class="gradient-text">3-5x improvement</span> in:
</h1>

<div class="tech-grid mt-12">
  <div v-click class="card-hover p-8 rounded-xl text-center">
    <carbon-data-vis-4 class="text-5xl mb-4 text-yellow-300"/>
    <h3 class="text-2xl">Context Windows</h3>
  </div>

  <div v-click class="card-hover p-8 rounded-xl text-center">
    <carbon-currency-dollar class="text-5xl mb-4 text-green-300"/>
    <h3 class="text-2xl">Pricing</h3>
  </div>

  <div v-click class="card-hover p-8 rounded-xl text-center">
    <carbon-document-export class="text-5xl mb-4 text-blue-300"/>
    <h3 class="text-2xl">Output Limits</h3>
  </div>
</div>

<p v-click class="text-2xl mt-12 text-center opacity-90">
  Your complex architecture? <span class="text-red-400 font-bold">Gone.</span>
</p>

---
layout: two-cols
class: text-white
---

## The Convergence Pattern 📈

<v-clicks>

**Last Year:**
- OpenAI Assistant API launched
- Built-in RAG, web search, memory
- Limited traction for RAG

**Why?**
- RAG was an exact science
- Tiny windows, dumb models
- High hallucination risks
- Fine-tuning obsessively required

</v-clicks>

::right::

<div class="mt-4">

<v-clicks>

**Now:**
- Throw in whole documents
- Top K? Make it 20!
- Bigger windows, lower prices
- Caching, better models

</v-clicks>

<div v-click class="mt-8 p-6 card-hover rounded-xl">
  <h3 class="gradient-text text-xl mb-3">The Pattern:</h3>
  <p class="text-lg">Problems vanish overnight with model updates</p>
</div>

</div>

---
layout: default
class: text-white
---

## The Shelf Life Problem ⏰

<div class="grid grid-cols-3 gap-6 mt-12">
  <div v-click class="card-hover p-6 rounded-xl text-center">
    <carbon-time class="text-4xl mb-4 text-orange-400"/>
    <h3 class="text-xl font-bold">6 Months</h3>
    <p class="text-sm mt-2">= An eternity in AI</p>
  </div>

  <div v-click class="card-hover p-6 rounded-xl text-center">
    <carbon-flash class="text-4xl mb-4 text-yellow-400"/>
    <h3 class="text-xl font-bold">Updates Hit Fast</h3>
    <p class="text-sm mt-2">And they hit hard</p>
  </div>

  <div v-click class="card-hover p-6 rounded-xl text-center">
    <carbon-trash-can class="text-4xl mb-4 text-red-400"/>
    <h3 class="text-xl font-bold">3/6 Steps Gone</h3>
    <p class="text-sm mt-2">By year's end</p>
  </div>
</div>

<div v-click class="mt-12 text-center">
  <p class="text-2xl">Why perfect a <span class="gradient-text">six-step swarm</span> today</p>
  <p class="text-2xl mt-2">when next release <span class="text-red-400">collapses it to one prompt?</span></p>
</div>

---
layout: image-right
image: https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png
class: text-white
---

## The Race Against Time 🏃‍♂️

<div class="space-y-8">

<v-clicks>

<div>
  <h3 class="text-2xl gradient-text">LangChain</h3>
  <p>Racing against convergence</p>
</div>

<div>
  <h3 class="text-2xl gradient-text">Crew</h3>
  <p>Fighting obsolescence</p>
</div>

<div>
  <h3 class="text-2xl gradient-text">Swarm</h3>
  <p>Temporary scaffolding</p>
</div>

</v-clicks>

<div v-click class="mt-8 p-4 card-hover rounded-xl">
  <p class="text-lg">All racing against the point where raw model power outstrips their utility</p>
</div>

</div>

---
layout: center
class: text-white
---

## The Smarter Bet 🎯

<div class="grid grid-cols-2 gap-12 mt-12">
  <div v-click class="text-center">
    <carbon-thumbs-down class="text-6xl text-red-400 mb-4 mx-auto"/>
    <h3 class="text-2xl mb-4">Complex Architecture</h3>
    <ul class="text-left space-y-2">
      <li>• Brittle & fragile</li>
      <li>• High maintenance</li>
      <li>• Soon obsolete</li>
    </ul>
  </div>

  <div v-click class="text-center">
    <carbon-thumbs-up class="text-6xl text-green-400 mb-4 mx-auto"/>
    <h3 class="text-2xl mb-4">Simplicity</h3>
    <ul class="text-left space-y-2">
      <li>• Fewer moving parts</li>
      <li>• Models will improve</li>
      <li>• Future-proof design</li>
    </ul>
  </div>
</div>

---
layout: default
class: text-white
---

## The Bottom Line 💡

<div class="space-y-6 mt-8">

<v-clicks>

<div class="card-hover p-6 rounded-xl">
  <carbon-checkmark-outline class="text-3xl text-green-400 float-left mr-4"/>
  <p class="text-xl">Agent architectures are <span class="gradient-text">critical now</span></p>
  <p class="opacity-80">They squeeze the most out of today's tech</p>
</div>

<div class="card-hover p-6 rounded-xl">
  <carbon-warning-alt class="text-3xl text-yellow-400 float-left mr-4"/>
  <p class="text-xl">But they're <span class="gradient-text">not evergreen</span></p>
  <p class="opacity-80">They won't last as models improve</p>
</div>

<div class="card-hover p-6 rounded-xl">
  <carbon-idea class="text-3xl text-blue-400 float-left mr-4"/>
  <p class="text-xl">The best architecture solves with <span class="gradient-text">fewest parts</span></p>
  <p class="opacity-80">Especially when those parts get smarter daily</p>
</div>

</v-clicks>

</div>

---
layout: cover
class: text-white text-center
---

<div class="flex flex-col items-center justify-center h-full">
  <h1 class="text-5xl font-bold mb-8">
    <span class="gradient-text">Build for Tomorrow</span>
  </h1>

  <p class="text-2xl opacity-90 mb-12">
    Not yesterday's limitations
  </p>

  <div class="flex gap-6">
    <div v-click class="card-hover px-8 py-4 rounded-xl">
      <p class="text-xl">Lean on optimism</p>
    </div>
    <div v-click class="card-hover px-8 py-4 rounded-xl">
      <p class="text-xl">Embrace simplicity</p>
    </div>
    <div v-click class="card-hover px-8 py-4 rounded-xl">
      <p class="text-xl">Models will improve</p>
    </div>
  </div>

  <div v-click class="mt-12 text-lg opacity-80">
    <p>Thank you!</p>
  </div>
</div>