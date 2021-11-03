import { expect } from "chai";
import { ethers } from "hardhat";

describe("MrSkinner", function () {
  beforeEach(async function () {
    this.MrSkinner = await (await ethers.getContractFactory("MrSkinner")).deploy()
    this.MrSkinner.deployed()
  })

  it("gets no skins for summoner 1460449", async function () {
    const skin = await this.MrSkinner.tokenURI(1460449)
    expect(skin).to.be.empty
    console.log(skin)
  });
});
