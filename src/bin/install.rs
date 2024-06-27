use std::process;

#[rustfmt::skip]
const PACKAGES: &[&str] = &[
    // system
    "build-base", "openssl-dev",

    // graphics
    "linux-firmware-amdgpu", "mesa-dev", "mesa-dri-gallium", "mesa-va-gallium", "mesa-vulkan-ati",

    // pipewire
    "wireplumber", "pipewire", "pipewire-pulse", "pipewire-spa-vulkan",
];

fn install_packages() {
    process::Command::new("apk")
        .arg("add")
        .args(PACKAGES)
        .spawn()
        .unwrap()
        .wait_with_output()
        .expect("failed to install packages");
}

fn main() {
    install_packages();
}
