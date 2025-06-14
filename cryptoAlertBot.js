/**
 * Crypto Alert Bot Absurd
 * Kirim alert kalau BTC nyentuh angka memenya: 6,969.420
 * Bukan untuk ditaruh di production 🤡
 */

const currentPrice = 6969.42; // Mock data

function checkBTC() {
    if (currentPrice === 6969.42) {
        console.log("🔥 ALERT: BTC menyentuh angka memetik takdir — 6,969.420");
        console.log("🧙‍♂️ Satoshi is watching.");
    } else {
        console.log("📉 Harga BTC belum absurd. Lanjut ngopi.");
    }
}

checkBTC();