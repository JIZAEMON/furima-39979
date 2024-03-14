const pay = () => {
  const publicKey = gon.public_key
  console.log("カード情報トークン化のためのJavaScript");
};

window.addEventListener("turbo:load", pay);