// use clap::Parser;
use std::env;
// use tokio::sync::mpsc;

// #[derive(Parser, Debug)]
// #[command(version, about, long_about = None)]
// struct Args {
//     #[arg(short, long)]
// }

//----------------------- Define Module Tasks ---------------------------------
// mod task;

//*************************************************************************** */
#[tokio::main]
async fn main() {
    // Get version from Cargo.toml using env! macro
    let version = env!("CARGO_PKG_VERSION");
    let app_name = env!("CARGO_PKG_NAME");
    let description = env!("CARGO_PKG_DESCRIPTION");

    println!("Application: {}", app_name);
    println!("version: {}", version);
    println!("Description: {}", description);
    println!("**************************************************************");

    //******************** Config ************************* */
    
    //******************* Tasks ************************** */
    
    //******************** Loop Forever ***************************** */
    println!("Hello World");
}