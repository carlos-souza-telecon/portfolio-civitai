class CivitaiImages {
  List<Items>? items;
  Metadata? metadata;

  CivitaiImages({this.items, this.metadata});

  CivitaiImages.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    return data;
  }
}

class Items {
  int? id;
  String? url;
  String? hash;
  int? width;
  int? height;
  String? nsfwLevel;
  bool? nsfw;
  int? browsingLevel;
  String? createdAt;
  int? postId;
  Stats? stats;
  Meta? meta;
  String? username;

  Items(
      {this.id,
      this.url,
      this.hash,
      this.width,
      this.height,
      this.nsfwLevel,
      this.nsfw,
      this.browsingLevel,
      this.createdAt,
      this.postId,
      this.stats,
      this.meta,
      this.username});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    hash = json['hash'];
    width = json['width'];
    height = json['height'];
    nsfwLevel = json['nsfwLevel'];
    nsfw = json['nsfw'];
    browsingLevel = json['browsingLevel'];
    createdAt = json['createdAt'];
    postId = json['postId'];
    stats = json['stats'] != null ? Stats.fromJson(json['stats']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['hash'] = hash;
    data['width'] = width;
    data['height'] = height;
    data['nsfwLevel'] = nsfwLevel;
    data['nsfw'] = nsfw;
    data['browsingLevel'] = browsingLevel;
    data['createdAt'] = createdAt;
    data['postId'] = postId;
    if (stats != null) {
      data['stats'] = stats!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['username'] = username;
    return data;
  }
}

class Stats {
  int? cryCount;
  int? laughCount;
  int? likeCount;
  int? dislikeCount;
  int? heartCount;
  int? commentCount;

  Stats(
      {this.cryCount,
      this.laughCount,
      this.likeCount,
      this.dislikeCount,
      this.heartCount,
      this.commentCount});

  Stats.fromJson(Map<String, dynamic> json) {
    cryCount = json['cryCount'];
    laughCount = json['laughCount'];
    likeCount = json['likeCount'];
    dislikeCount = json['dislikeCount'];
    heartCount = json['heartCount'];
    commentCount = json['commentCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cryCount'] = cryCount;
    data['laughCount'] = laughCount;
    data['likeCount'] = likeCount;
    data['dislikeCount'] = dislikeCount;
    data['heartCount'] = heartCount;
    data['commentCount'] = commentCount;
    return data;
  }
}

class Meta {
  String? size;
  int? seed;
  String? model;
  int? steps;
  Hashes? hashes;
  String? prompt;
  String? version;
  String? sampler;
  double? cfgScale;
  List<Resources>? resources;
  String? modelHash;
  String? scheduleType;
  String? distilledCFGScale;
  String? negativePrompt;
  String? diffusionInLowBits;
  int? clipSkip;
  String? createdDate;
  List<CivitaiResources>? civitaiResources;
  String? maskBlur;
  String? denoisingStrength;

  Meta(
      {this.size,
      this.seed,
      this.model,
      this.steps,
      this.hashes,
      this.prompt,
      this.version,
      this.sampler,
      this.cfgScale,
      this.resources,
      this.modelHash,
      this.scheduleType,
      this.distilledCFGScale,
      this.negativePrompt,
      this.diffusionInLowBits,
      this.clipSkip,
      this.createdDate,
      this.civitaiResources,
      this.maskBlur,
      this.denoisingStrength});

  Meta.fromJson(Map<String, dynamic> json) {
    size = json['Size'];
    seed = json['seed'];
    model = json['Model'];
    steps = json['steps'];
    hashes = json['hashes'] != null ? Hashes.fromJson(json['hashes']) : null;
    prompt = json['prompt'];
    version = json['Version'];
    sampler = json['sampler'];
    cfgScale = double.tryParse(json['cfgScale'].toString());
    if (json['resources'] != null) {
      resources = <Resources>[];
      json['resources'].forEach((v) {
        resources!.add(Resources.fromJson(v));
      });
    }
    modelHash = json['Model hash'];
    scheduleType = json['Schedule type'];
    distilledCFGScale = json['Distilled CFG Scale'];
    negativePrompt = json['negativePrompt'];
    diffusionInLowBits = json['Diffusion in Low Bits'];
    clipSkip = json['clipSkip'];
    createdDate = json['Created Date'];
    if (json['civitaiResources'] != null) {
      civitaiResources = <CivitaiResources>[];
      json['civitaiResources'].forEach((v) {
        civitaiResources!.add(CivitaiResources.fromJson(v));
      });
    }
    maskBlur = json['Mask blur'];
    denoisingStrength = json['Denoising strength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Size'] = size;
    data['seed'] = seed;
    data['Model'] = model;
    data['steps'] = steps;
    if (hashes != null) {
      data['hashes'] = hashes!.toJson();
    }
    data['prompt'] = prompt;
    data['Version'] = version;
    data['sampler'] = sampler;
    data['cfgScale'] = cfgScale;
    if (resources != null) {
      data['resources'] = resources!.map((v) => v.toJson()).toList();
    }
    data['Model hash'] = modelHash;
    data['Schedule type'] = scheduleType;
    data['Distilled CFG Scale'] = distilledCFGScale;
    data['negativePrompt'] = negativePrompt;
    data['Diffusion in Low Bits'] = diffusionInLowBits;
    data['clipSkip'] = clipSkip;
    data['Created Date'] = createdDate;
    if (civitaiResources != null) {
      data['civitaiResources'] =
          civitaiResources!.map((v) => v.toJson()).toList();
    }
    data['Mask blur'] = maskBlur;
    data['Denoising strength'] = denoisingStrength;
    return data;
  }
}

class Hashes {
  String? model;
  String? loraFluxMythP0rtr4itStyle;
  String? loraFluxEpicDragons;
  String? loraCharacterDesignFluxV2;
  String? loraFluxMaleniaNorm;
  String? loraAziibPixelStyle;
  String? loraFluxPs1Vv;

  Hashes(
      {this.model,
      this.loraFluxMythP0rtr4itStyle,
      this.loraFluxEpicDragons,
      this.loraCharacterDesignFluxV2,
      this.loraFluxMaleniaNorm,
      this.loraAziibPixelStyle,
      this.loraFluxPs1Vv});

  Hashes.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    loraFluxMythP0rtr4itStyle = json['lora:FluxMythP0rtr4itStyle'];
    loraFluxEpicDragons = json['lora:FluxEpicDragons'];
    loraCharacterDesignFluxV2 = json['lora:CharacterDesign-FluxV2'];
    loraFluxMaleniaNorm = json['lora:FluxMaleniaNorm'];
    loraAziibPixelStyle = json['lora:Aziib_Pixel_Style'];
    loraFluxPs1Vv = json['lora:flux-ps1-vv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['model'] = model;
    data['lora:FluxMythP0rtr4itStyle'] = loraFluxMythP0rtr4itStyle;
    data['lora:FluxEpicDragons'] = loraFluxEpicDragons;
    data['lora:CharacterDesign-FluxV2'] = loraCharacterDesignFluxV2;
    data['lora:FluxMaleniaNorm'] = loraFluxMaleniaNorm;
    data['lora:Aziib_Pixel_Style'] = loraAziibPixelStyle;
    data['lora:flux-ps1-vv'] = loraFluxPs1Vv;
    return data;
  }
}

class Resources {
  String? hash;
  String? name;
  String? type;
  double? weight;

  Resources({this.hash, this.name, this.type, this.weight});

  Resources.fromJson(Map<String, dynamic> json) {
    hash = json['hash'];
    name = json['name'];
    type = json['type'];
    weight = double.tryParse(json['weight'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hash'] = hash;
    data['name'] = name;
    data['type'] = type;
    data['weight'] = weight;
    return data;
  }
}

class CivitaiResources {
  String? type;
  int? modelVersionId;
  String? modelVersionName;

  CivitaiResources({this.type, this.modelVersionId, this.modelVersionName});

  CivitaiResources.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    modelVersionId = json['modelVersionId'];
    modelVersionName = json['modelVersionName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['modelVersionId'] = modelVersionId;
    data['modelVersionName'] = modelVersionName;
    return data;
  }
}

class Metadata {
  String? nextCursor;
  String? nextPage;

  Metadata({this.nextCursor, this.nextPage});

  Metadata.fromJson(Map<String, dynamic> json) {
    nextCursor = json['nextCursor'];
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nextCursor'] = nextCursor;
    data['nextPage'] = nextPage;
    return data;
  }
}
