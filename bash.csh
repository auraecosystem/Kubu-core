# Clone
git clone https://github.com/dp-web4/SAGE.git
cd SAGE

# Initialize a new SAGE instance
python3 -m sage.instances.init --machine mybox --model gemma3:4b --operator-name yourname

# Build the Rust daemon
cd sage-rs && cargo build --release && cd ..

# Start it (env vars configure per-machine)
SAGE_MACHINE=mybox SAGE_MODEL=gemma3:4b ./sage-rs/target/release/sage-daemon

# Dashboard at http://localhost:8760/
